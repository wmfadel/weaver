import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/core/services/local_notifications.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/pomo/widgets/control_buttons.dart';
import 'package:weaver/features/pomo/widgets/counter_text.dart';
import 'package:weaver/features/pomo/widgets/state_chips/chip_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();
    return BlocConsumer<PomoCubit, PomoState>(
      listener: (context, state) {
        if (state.progress == 0) {
          final String description =
              state is FocusPomo ? 'Break Time' : 'Back to Work';
          NotificationsHelper().showNotification(
              id: Random(DateTime.now().microsecondsSinceEpoch).nextInt(1000),
              title: 'Time is up!',
              body: description);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: pomoCubit.backgroundColor,
          body: Center(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                ChipBuilder(),
                CounterText(),
                ControlButtons(),

              ],
            ),
          ),
        );
      },
    );
  }
}
