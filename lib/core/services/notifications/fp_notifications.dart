import 'dart:async';
import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:pomo/core/exceptions/app_error.dart';
import 'package:pomo/core/services/notifications/local_notifications.dart';
import 'package:pomo/core/utils/logger.dart';

/// class handling [FirebaseMessaging] setup, token, permissions,
/// listening to [RemoteMessage]s and showing notification
class FBNotifications implements Disposable{
  FBNotifications() {
    _init();
  }

  /// local copy of the [FirebaseMessaging] fcm token, used to quickly check
  /// if notifications are enabled or not.
  String? _token;

  String? get fcmToken => _token;

  /// client class for `flutter_local_notifications` plugin for showing
  /// local notifications in foreground.
  final NotificationsHelper _notificationsHelper = NotificationsHelper();

  /// initializes [FirebaseMessaging] setup be calling :
  /// [_handleNotificationsPermissions] : for iOS permissions
  /// [_handleNotificationsToken] : updating local `_token` variable
  /// [_listenToForegroundNotification] : listen and show UI updated accordingly
  /// [_listenToBackgroundNotifications] [_listenToNotificationsOpenedApp] listeners
  _init() async {
    await _handleNotificationsPermissions();
    await _handleNotificationsToken();
    _listenToForegroundNotification();
    // _listenToBackgroundNotifications();
    // _listenToNotificationsOpenedApp();
  }

  /// stops the app from receiving any notifications by calling
  /// [FirebaseMessaging.deleteToken] and deleting local `_token` variable
  Future<void> stopReceivingNotifications() async {
    try {
      await FirebaseMessaging.instance.deleteToken();
      _token = null;
    } catch (e) {
      AppLog.e(e);
      _token = null;
      throw (const OperationFailedException(
          'Failed to stop receiving notifications'));
    }
  }

  /// re-enables receiving notifications using [_handleNotificationsToken]
  /// if notifications is already enabled will delete current token
  /// and create a new one [RefreshToken] and update local `_token` variable
  enableNotifications() async {
    try {
      if (_token != null) {
        stopReceivingNotifications();
      }
      await _handleNotificationsToken();
    } on AppError catch (e) {
      AppLog.e(e);
      rethrow;
    } catch (_) {
      AppLog.e('failed re-enabling notifications');
      throw const OperationFailedException('failed re-enabling notifications');
    }
  }

  /// listens to a stream of [RemoteMessage] from [FirebaseMessaging]
  /// and shows a notification based on the [RemoteMessage] data
  _listenToForegroundNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      AppLog.w('Got a message whilst in the foreground!\n'
          'Message data: ${message.data}\n'
          'Message id: ${message.messageId}\n'
          'Notification body: ${message.notification?.body}\n'
          'Notification title: ${message.notification?.title}\n'
          'Notification sound: ${message.sentTime}');

      if (message.notification != null) {
        _notificationsHelper.showNotification(
          // random message id with the limit of being less than 32 bit number
          id: Random(DateTime.now().microsecondsSinceEpoch).nextInt(9999),
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
        );
      }
    });
  }



  // /// listens to a stream of [RemoteMessage] from [FirebaseMessaging]
  // /// When the app is in the background, will not show any updates to UI
  // /// just listening for the incoming messages.
  // _listenToBackgroundNotifications() {
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // }
  //
  // _listenToNotificationsOpenedApp() {
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     AppLog.v('onMessageOpenedApp ${message.data}');
  //   });
  // }

  /// request user permission to receive notifications
  /// and returns a `boolean` indicated weather the user granted or not
  Future<bool> _handleNotificationsPermissions() async {
    NotificationSettings settings =
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  /// fetches notifications token using [FirebaseMessaging.getToken] and
  /// starts listening to [FirebaseMessaging.onMessage] stream for
  /// token changes and updates the token in the [_token] field
  _handleNotificationsToken() async {
    try {
      _token = await FirebaseMessaging.instance.getToken();
      AppLog.w('FCMToken: $_token');
      FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
        _token = fcmToken;
        AppLog.i('FCMToken: $fcmToken');
      }).onError((err) {
        AppLog.e(err);
      });
    } on FirebaseException catch (e) {
      AppLog.e(e);
    }
  }

  @override
  FutureOr onDispose() {
    FirebaseMessaging.onMessage.drain();
  }
}

// /// background message handler. MUST be high level function,
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   AppLog.v('_firebaseMessagingBackgroundHandler ${message.data}');
// }