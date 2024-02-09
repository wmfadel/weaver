import 'dart:ui';

import 'package:weaver/core/constants/colors.dart';

enum TimerStates {
  focus(AppColors.red900),
  shortBreak(AppColors.green900),
  longBreak(AppColors.blue900);

  final Color textColor;

  const TimerStates(this.textColor);
}
