import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import 'base_state_chip.dart';

class FocusChip extends StatelessWidget {
  const FocusChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseStateChip(
      icon: Images.brain,
      label: 'Focus',
      color: AppColors.red900,
      backgroundColor: AppColors.red100.withOpacity(0.8),
    );
  }
}
