import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sakina_app/core/constants/azkar_keys.dart';
import 'package:sakina_app/core/notification/notification_init.dart';
import 'package:timezone/timezone.dart' as tz;

enum PrayerType { fajr, dhuhr, asr, maghrib, isha }

class AdhanNotification {
  static final notification =
      InitNotificationService.flutterLocalNotificationsPlugin;
  static Future<void> createChannel() async {
    final androidPlugin = notification
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        'fajr_channel',
        'Fajr Adhan',
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('fajr'),
      ),
    );

    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        'dhuhr_channel',
        'Dhuhr Adhan',
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('dhuhr'),
      ),
    );
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        'asr_channel',
        'Asr Adhan',
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('asr'),
      ),
    );

    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        'maghrib_channel',
        'Maghrib Adhan',
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('maghrib'),
      ),
    );
    await androidPlugin?.createNotificationChannel(
      const AndroidNotificationChannel(
        'isha_channel',
        'Isha Adhan',
        importance: Importance.max,
        // sound: RawResourceAndroidNotificationSound('isha'),
      ),
    );
  }

  static Future<void> scheduleAdhan({
    required DateTime dateTime,
    required PrayerType prayer,
    required int id,
  }) async {
    final chanelId = '${prayer.name.toLowerCase()}_channel';
    await notification.zonedSchedule(
      id: id,
      title: 'حان الآن موعد الأذان',
      body: prayersMap[prayer.name],
      scheduledDate: tz.TZDateTime.from(dateTime, tz.local),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          chanelId,
          'Adhan Notifications',
          importance: Importance.max,
          priority: Priority.high,
        ),
      ),
      payload: AzkarKeys.adhanAzkar,
    );
  }

  static Map<String, String> prayersMap = {
    'fajr': 'صلاة الفجر',
    'dhuhr': 'صلاة الظهر',
    'asr': 'صلاة العصر',
    'maghrib': 'صلاة المغرب',
    'isha': 'صلاة العشاء',
  };
}
