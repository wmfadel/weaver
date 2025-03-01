import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:weaver/core/constants/strings.dart';

/// This class is a wrapper around
/// https://pub.dev/packages/flutter_local_notifications
///
/// It provides multiple functions to handle notifications in multiple use cases
/// This file must be initialized by the only available constructor taking
/// the page [BuildContext]
///
class NotificationsHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late final DarwinInitializationSettings initializationSettingsDarwin;
  late final AndroidInitializationSettings initializationSettingsAndroid;

  /// initializing package requirements in constructor
  NotificationsHelper() {
    initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/ic_launcher');
    initializationSettingsDarwin = const DarwinInitializationSettings();

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification,
    );
  }

  /// shows instant notification with title, body, icon, payload all optional,
  /// all notifications use the same channel ID and details
  /// -defined in const Strings file- to replace
  /// them selves when showing a notification it will dismiss the previous one
  ///
  /// the payload is the data used to customize click action it can be
  /// a string or encoded map (json)
  showNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
    String? sound,
  }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showProgress: true,
      playSound: true,
      ticker: 'ticker',
    );
    final iOSPlatformChannelSpecifics = DarwinNotificationDetails(
      presentSound: true,
      sound: sound,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      id ?? 0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  /// used to show a notification after a period of time, specified by the
  /// duration parameter
  showScheduledNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
    required Duration duration,
  }) async {
    tz.initializeTimeZones();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
    );
    const iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(presentSound: true);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id ?? 0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      platformChannelSpecifics,
      payload: payload,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// used to show a notification every while specified by the required
  /// [RepeatInterval] value
  showPeriodicNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
    required RepeatInterval repeatInterval,
  }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
    );
    var iOSPlatformChannelSpecifics =
        const DarwinNotificationDetails(presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
      macOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id ?? 0,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  /// closes all visible notifications
  cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}

/// requesting notification permission on android 13
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
// flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
//     AndroidFlutterLocalNotificationsPlugin>().requestPermission();
