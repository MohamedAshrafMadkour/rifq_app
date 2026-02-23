import 'package:sakina_app/core/notification/adhan_notification.dart';
import 'package:sakina_app/core/notification/azkar_notification_service.dart';
import 'package:sakina_app/core/notification/moring_evening_zakar_notification.dart';

class NotificationBootstrap {
  static Future<void> init() async {
    await Future.wait([
      AdhanNotification.createChannel(),
      AzkarNotificationService.createChannels(),
      MorningEveningAzkarNotification.createChannel(),
    ]);
  }
}
