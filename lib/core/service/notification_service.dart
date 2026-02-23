import 'dart:developer';
import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sakina_app/core/service/data_base_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  static final NotificationService instance = NotificationService._internal();

  NotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // 1. تهيئة المناطق الزمنية والموقع المحلي
    tz.initializeTimeZones();
    try {
      // ضبط الموقع على توقيت القاهرة لضمان الدقة مع توقيت الجهاز
      tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
    } catch (e) {
      log("Error setting location: $e");
    }

    final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
        flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin
            >();

    // 2. طلب أذونات أندرويد 13+ و Exact Alarms
    await androidImplementation?.requestExactAlarmsPermission();
    await androidImplementation?.requestNotificationsPermission();

    // 3. تعريف قناة الإشعارات (تغيير الـ ID إلى v2 لضمان تحديث الإعدادات)
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'sakina_reminders_v2',
      'Reminders',
      description: 'Reminder notifications',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
    );

    await androidImplementation?.createNotificationChannel(channel);

    // 4. إعدادات الأيقونة (استخدام @mipmap/ic_launcher لأنه اشتغل معك في الفوري)
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings settings = InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: settings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        if (response.payload == null) return;

        final int id = int.parse(response.payload!);

        try {
          final reminders = await DataBaseService.instance.getAllReminders();
          final reminder = reminders.firstWhere((r) => r.id == id);

          // إذا لم يكن التذكير يومياً، نقوم بتعطيله في قاعدة البيانات بعد الرنين
          if (!reminder.repeatedEveryday) {
            await DataBaseService.instance.updateReminderEnabled(
              id: id,
              isEnabled: false,
            );
            await flutterLocalNotificationsPlugin.cancel(id: id);
          }
        } catch (e) {
          log("Notification response error: $e");
        }
      },
    );
  }

  // دالة الجدولة المحدثة بنمط alarmClock
  Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required bool repeatedEveryday,
  }) async {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

    // بناء التاريخ المجدول بناءً على وقت القاهرة
    var scheduledDate = tz.TZDateTime(
      tz.local,
      scheduledTime.year,
      scheduledTime.month,
      scheduledTime.day,
      scheduledTime.hour,
      scheduledTime.minute,
    );

    // إذا كان الوقت قد فات، جدول الإشعار للغد تلقائياً
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'sakina_reminders_v2', // نفس الـ ID الجديد
          'Reminders',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          fullScreenIntent: true, // يضمن ظهور الإشعار كـ Popup
          ticker: 'ticker',
        ),
      ),
      payload: id.toString(),
      // نمط alarmClock هو الأدق في أندرويد لضمان العمل حتى في وضع توفير الطاقة
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: repeatedEveryday
          ? DateTimeComponents.time
          : null,
    );

    log("✅ Notification Scheduled: $scheduledDate (ID: $id)");
  }

  // اختبار الإشعار الفوري
  Future<void> showInstantNotification() async {
    await flutterLocalNotificationsPlugin.show(
      id: 999,
      title: 'اختبار فوري',
      body: 'لو ظهر هذا، فالإعدادات سليمة والمشكلة في الجدولة فقط',
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'sakina_reminders_v2',
          'Reminders',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
      ),
      payload: 'test_payload',
    );
  }

  // تحويل النص (HH:mm) إلى DateTime ليومنا الحالي
  DateTime convertTimeStringToDateTime(String timeString) {
    final parts = timeString.split(':');
    final int hour = int.parse(parts[0]);
    final int minute = int.parse(parts[1]);

    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}
