import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';

class CounterText extends StatelessWidget {
  const CounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();

    return BlocBuilder<PomoCubit, PomoState>(builder: (context, state) {
      final TextStyle? textStyle =
          Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 256,
                color: pomoCubit.textColor,
                fontWeight: state.playing ? FontWeight.w700 : FontWeight.w400,
              );
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 32),
          Text(formatMinutes(state.progress), style: textStyle),
          Text(formatSeconds(state.progress), style: textStyle),
          const SizedBox(height: 32),
        ],
      );
    });
  }

  String formatMinutes(int time) {
    final minutes = (time / 60).floor();
    return minutes.toString().padLeft(2, '0');
  }

  String formatSeconds(int time) {
    final seconds = time % 60;
    return seconds.toString().padLeft(2, '0');
  }
}
