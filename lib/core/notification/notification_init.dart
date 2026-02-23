import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class InitNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> notificationStreamController =
      StreamController();
  static void notificationBackgroundTap(
    NotificationResponse notificationResponse,
  ) {
    notificationStreamController.add(notificationResponse);
  }

  static void notificationTap(NotificationResponse response) {
    if (response.payload != null) {
      notificationStreamController.add(response);
    }
  }

  static Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );
    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: notificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationBackgroundTap,
    );
    await requestPermission();
  }

  static Future<void> requestPermission() async {
    final androidPlugin = flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();

    await androidPlugin?.requestNotificationsPermission();

    await androidPlugin?.requestExactAlarmsPermission();
  }
}
