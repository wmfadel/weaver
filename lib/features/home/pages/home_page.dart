import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/widgets/control_buttons.dart';
import 'package:pomo/features/home/widgets/state_chips/chipBuilder.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomoCubit, PomoState>(
      builder: (context, state) {
        log(state.toString());
        return Scaffold(
          backgroundColor: state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const ChipBuilder(),
                const SizedBox(height: 32),
                Text(
                  state.progress.toString(),
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
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }
}
