import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import 'base_state_chip.dart';

class LongBreakChip extends StatelessWidget {
  const LongBreakChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseStateChip(
      icon: Images.coffee,
      label: 'LongBreak',
      color: AppColors.blue900,
    );
  }
}
