import 'package:flutter/cupertino.dart';
import 'package:pomo/core/services/notifications/local_notifications.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';

class NotificationsStateHandler {
  final PomoState state;
  final NotificationsHelper _notificationsHelper;

  NotificationsStateHandler(this.state,
      {@visibleForTesting NotificationsHelper? notificationsHelper})
      : _notificationsHelper = notificationsHelper ?? NotificationsHelper();

  handle() {
    if (state is! FocusPomo && state.stateAfterSkip) {
      _notificationsHelper.showNotification(
        title: 'You are weak!!!',
        body: 'You skipped a pomo, you are weak!!!',
        payload: 'pomo_in_progress',
        sound: 'assets/audio/gojo_satoru_s_yowai_mo.mp3',
      );
    }
  }
}
