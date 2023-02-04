import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/features/home/controllers/pomo_cubit.dart';
import 'package:pomo/features/home/utils/notification_state_handler.dart';
import 'package:pomo/features/home/widgets/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pomoCubit = context.read<PomoCubit>();
    return BlocConsumer<PomoCubit, PomoState>(
      listener: (context, state) {
        log(state.toString());
        NotificationsStateHandler(state).handle();
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: pomoCubit.backgroundColor,
          body: const HomeView(),
        );
      },
    );
  }
}
