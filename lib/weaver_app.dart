import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/splash/controllers/splash_cubit.dart';
import 'package:weaver/router/app_router.dart';

import 'core/constants/styles.dart';

class WeaverApp extends StatelessWidget {
  WeaverApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit()..loadSettings(),
        ),
        BlocProvider<PomoCubit>(create: (context) => PomoCubit()),
      ],
      child: MaterialApp.router(
        title: 'Pomo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.light,
          textTheme: TextStyles.lightTheme,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
