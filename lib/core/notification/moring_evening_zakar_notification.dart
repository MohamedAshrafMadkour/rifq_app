import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sakina_app/core/constants/azkar_keys.dart';
import 'package:sakina_app/core/notification/notification_cancel.dart';
import 'package:sakina_app/core/notification/notification_init.dart';
import 'package:timezone/timezone.dart' as tz;

class MorningEveningAzkarNotification {
  static const String channelId = 'morning_evening_azkar_channel';

  static final _notifications =
      InitNotificationService.flutterLocalNotificationsPlugin;

  static Future<void> createChannel() async {
    final androidPlugin = _notifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        channelId,
        'Morning & Evening Azkar',
        description: 'أذكار الصباح والمساء',
        importance: Importance.max,
      ),
    );
  }

  static Future<void> _scheduleAzkar({
    required int id,
    required int hour,
    required String title,
    required String body,
    required String payload,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    var scheduledTime = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
    );

    if (scheduledTime.isBefore(now)) {
      scheduledTime = scheduledTime.add(const Duration(days: 1));
    }

    await _notifications.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledTime,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          'Morning & Evening Azkar',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: payload,
    );
  }

  static Future<void> scheduleMorning() async {
    await _scheduleAzkar(
      id: 501,
      hour: 6,
      title: 'أذكار الصباح 🌅',
      body: 'اللهم بك أصبحنا وبك أمسينا',
      payload: AzkarKeys.morningAzkar,
    );
  }

  static Future<void> scheduleEvening() async {
    await _scheduleAzkar(
      id: 502,
      hour: 18,
      title: 'أذكار المساء 🌙',
      body: 'أمسينا على فطرة الإسلام',
      payload: AzkarKeys.eveningAzkar,
    );
  }

  static Future<void> cancelAll() async {
    await NotificationCancelSetting.cancelNotification(id: 501);
    await NotificationCancelSetting.cancelNotification(id: 502);
  }
}
