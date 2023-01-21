import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/widgets/state_chips/focus_ship.dart';

import 'break_chip.dart';
import 'long_break_chip.dart';

/// Returns a Chip widget based on the state
class ChipBuilder extends StatelessWidget {
  const ChipBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomoCubit, PomoState>(builder: (context, state) {
      return state is FocusPomo
          ? const FocusChip()
          : state is BreakPomo
              ? const BreakChip()
              : const LongBreakChip();
    });
  }
}
