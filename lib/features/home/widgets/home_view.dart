import 'package:flutter/material.dart';
import 'package:pomo/features/home/widgets/control_buttons.dart';
import 'package:pomo/features/home/widgets/counter_text.dart';
import 'package:pomo/features/home/widgets/state_chips/chipBuilder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
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
    );
  }
}
