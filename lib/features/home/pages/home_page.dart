import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/widgets/control_buttons.dart';
import 'package:pomo/features/home/widgets/counter_text.dart';
import 'package:pomo/features/home/widgets/state_chips/chipBuilder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();
    return BlocBuilder<PomoCubit, PomoState>(
      builder: (context, state) {
        log(state.toString());
        return Scaffold(
          backgroundColor: pomoCubit.backgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
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
