import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:sakina_app/core/notification/prayer_notification.dart';
import 'package:sakina_app/core/notification/prayer_task_manager.dart';

class PrayerForegroundManager {
  static Future<void> startService() async {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: PrayerNotification.prayerChannelId,
        channelName: 'Current Prayer',
        channelDescription: 'الصلاة الحالية والقادمة',
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        autoRunOnBoot: true,
        eventAction: ForegroundTaskEventAction.repeat(60000),
      ),
      iosNotificationOptions: const IOSNotificationOptions(),
    );

    await FlutterForegroundTask.startService(
      notificationTitle: '🕌 الصلاة الحالية',
      notificationText: 'جاري حساب الصلاة...',
      callback: startCallback,
    );
  }

  static void startCallback() {
    FlutterForegroundTask.setTaskHandler(PrayerTask());
  }
}
