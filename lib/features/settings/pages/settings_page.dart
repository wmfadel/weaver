import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/settings/controllers/settings_cubit.dart';
import 'package:weaver/features/settings/widgets/counter_tile.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.watch<PomoCubit>();
    final settingsCubit = context.watch<SettingsCubit>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocListener<SettingsCubit, SettingsState>(
        listener: (context, state) {
          if (state is SettingsUpdate) {
            pomoCubit.settings = state.settings;
          }
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CounterTile(
              counter: settingsCubit.settings.focusLength ~/ 60,
              title: 'Focus Length',
              onIncrement: () {
                settingsCubit.updateSettings(
                  focusLength: settingsCubit.settings.focusLength + 60,
                );
              },
              onDecrement: () {
                settingsCubit.updateSettings(
                  focusLength: max(60, settingsCubit.settings.focusLength - 60),
                );
              },
              backgroundColor: pomoCubit.backgroundColor,
              textColor: pomoCubit.textColor,
            ),
            const SizedBox(height: 16),
            CounterTile(
              counter: settingsCubit.settings.pomosCount,
              title: 'Pomodoros until long break',
              onIncrement: () {
                settingsCubit.updateSettings(
                  pomosCount: min(10, settingsCubit.settings.pomosCount + 1),
                );
              },
              onDecrement: () {
                settingsCubit.updateSettings(
                  pomosCount: max(1, settingsCubit.settings.pomosCount - 1),
                );
              },
              backgroundColor: pomoCubit.backgroundColor,
              textColor: pomoCubit.textColor,
            ),
            const SizedBox(height: 16),
            CounterTile(
              counter: settingsCubit.settings.shortBreakLength ~/ 60,
              title: 'Short Break Length',
              onIncrement: () {
                settingsCubit.updateSettings(
                  shortBreakLength:
                      settingsCubit.settings.shortBreakLength + 60,
                );
              },
              onDecrement: () {
                settingsCubit.updateSettings(
                  shortBreakLength:
                      max(60, settingsCubit.settings.shortBreakLength - 60),
                );
              },
              backgroundColor: pomoCubit.backgroundColor,
              textColor: pomoCubit.textColor,
            ),
            const SizedBox(height: 16),
            CounterTile(
              counter: settingsCubit.settings.longBreakLength ~/ 60,
              title: 'Long Break Length',
              onIncrement: () {
                settingsCubit.updateSettings(
                  longBreakLength: settingsCubit.settings.longBreakLength + 60,
                );
              },
              onDecrement: () {
                settingsCubit.updateSettings(
                  longBreakLength:
                      min(60, settingsCubit.settings.longBreakLength - 60),
                );
              },
              backgroundColor: pomoCubit.backgroundColor,
              textColor: pomoCubit.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
