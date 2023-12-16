import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/constants/images.dart';
import 'package:pomo/core/utils/side_sheet.dart';
import 'package:pomo/core/widgets/PoImage.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/settings/controllers/settings_cubit.dart';
import 'package:pomo/features/settings/pages/settings_page.dart';

class ControlButtons extends StatelessWidget {
  const ControlButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();
    return BlocBuilder<PomoCubit, PomoState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ControlButton(
              icon: Images.more,
              color: _secondaryColor(state),
              iconColor: _iconsColor(state),
              width: 80,
              height: 80,
              onPressed: () {
                final SettingsCubit cubit = SettingsCubit(pomoCubit.settings);
                final settingsView = BlocProvider(
                  create: (_) => cubit,
                  child: const SettingsPage(),
                );
                if (Platform.isAndroid) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(),
                        body: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 64,
                          ),
                          child: settingsView,
                        ),
                      ),
                    ),
                  );
                } else {
                  SideSheet.end(
                    title: 'Settings',
                    body: settingsView,
                    context: context,
                    backgroundColor: pomoCubit.backgroundColor,
                    textColor: pomoCubit.textColor,
                  );
                }
              },
            ),
            const SizedBox(width: 16),
            _ControlButton(
              icon: pomoCubit.isPlaying ? Images.pause : Images.play,
              color: _primaryColor(state),
              iconColor: _iconsColor(state),
              width: 128,
              height: 96,
              onPressed: () => pomoCubit.toggle(),
            ),
            const SizedBox(width: 16),
            _ControlButton(
              icon: Images.skip,
              color: _secondaryColor(state),
              iconColor: _iconsColor(state),
              width: 80,
              height: 80,
              onPressed: () => pomoCubit.skip(),
            ),
          ],
        );
      },
    );
  }

  Color _primaryColor(PomoState state) {
    return state is FocusPomo
        ? AppColors.red500.withOpacity(0.71)
        : state is BreakPomo
            ? AppColors.green500.withOpacity(0.71)
            : AppColors.blue500.withOpacity(0.71);
  }

  Color _secondaryColor(PomoState state) {
    return state is FocusPomo
        ? AppColors.red100.withOpacity(0.8)
        : state is BreakPomo
            ? AppColors.green100.withOpacity(0.8)
            : AppColors.blue100.withOpacity(0.8);
  }

  Color _iconsColor(PomoState state) {
    return state is FocusPomo
        ? AppColors.red900
        : state is BreakPomo
            ? AppColors.green900
            : AppColors.blue900;
  }
}

class _ControlButton extends StatelessWidget {
  final Color color;
  final String icon;
  final Color iconColor;
  final double width;
  final double height;
  final VoidCallback onPressed;

  const _ControlButton({
    required this.color,
    required this.icon,
    required this.iconColor,
    required this.width,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: PoImage(
              icon,
              color: iconColor,
              width: 32,
              height: 32,
            ),
          ),
        ),
      ),
    );
  }
}
