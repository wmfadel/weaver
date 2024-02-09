import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import 'base_state_chip.dart';

class BreakChip extends StatelessWidget {
  const BreakChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BaseStateChip(
      icon: Images.coffee,
      label: 'Break',
      color: AppColors.green900,
    );
  }
}
