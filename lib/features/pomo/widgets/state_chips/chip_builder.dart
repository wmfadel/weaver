import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/pomo/widgets/state_chips/focus_ship.dart';

import 'break_chip.dart';
import 'long_break_chip.dart';

/// Returns a Chip widget based on the state
class ChipBuilder extends StatelessWidget {
  const ChipBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PomoCubit, PomoState>(builder: (context, state) {
      return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInCirc,
          switchOutCurve: Curves.easeOut,
          child: state is FocusPomo
              ? const FocusChip()
              : state is BreakPomo
                  ? const BreakChip()
                  : const LongBreakChip());
    });
  }
}
