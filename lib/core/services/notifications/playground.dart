import 'package:flutter/material.dart';

import 'local_notifications.dart';

/// Totally unrelated to the app, just a playground for notifications.
class NotificationsPlayground extends StatelessWidget {
  const NotificationsPlayground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NotificationsHelper notificationsHelper = NotificationsHelper();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications Playground'),
      ),
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Notifications Playground'),
          TextButton(
              onPressed: () {
                notificationsHelper.showNotification(
                  id: 1,
                  title: 'title',
                  body: 'body',
                  payload: 'payload',
                );
              },
              child: const Text('show notification')),
          TextButton(
              onPressed: () {
                notificationsHelper.showScheduledNotification(
                  id: 2,
                  title: 'title',
                  body: 'body',
                  payload: 'payload',
                  duration: const Duration(seconds: 5),
                );
              },
              child: const Text('show notification after 5 seconds')),
          TextButton(
              onPressed: () {
                notificationsHelper.cancelAllNotifications();
              },
              child: const Text('clear notifications ')),
        ],
      )),
    );
  }
}
