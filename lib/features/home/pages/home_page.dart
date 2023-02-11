import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/core/services/local_notifications.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/widgets/control_buttons.dart';
import 'package:pomo/features/home/widgets/counter_text.dart';
import 'package:pomo/features/home/widgets/state_chips/chipBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
          body: const Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32, width: double.maxFinite),
                  ChipBuilder(),
                  CounterText(),
                  ControlButtons(),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
