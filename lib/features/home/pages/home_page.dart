import 'package:flutter/material.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/features/home/widgets/control_buttons.dart';

import '../widgets/state_chips/focus_ship.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.red50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            const FocusChip(),
            const SizedBox(height: 32),
            Text(
              '25\n00',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 256),
            ),
            const SizedBox(height: 32),
            ControlButtons(
              mainColor: AppColors.red500.withOpacity(0.71),
              secondaryColor: AppColors.red100.withOpacity(0.8),
              iconColor: AppColors.red900,
              isPlaying: false,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
