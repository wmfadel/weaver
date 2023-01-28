import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:pomo/features/splash/controllers/splash_cubit.dart';
import 'package:pomo/features/splash/pages/splash_page.dart';

import 'core/constants/styles.dart';
import 'features/home/controllers/pomo_cubit.dart';

class PomoApp extends StatefulWidget {
  const PomoApp({super.key});

  @override
  State<PomoApp> createState() => _PomoAppState();
}

class _PomoAppState extends State<PomoApp> {
  @override
  void initState() {
    super.initState();
    if (!GetIt.instance.isRegistered<Settings>()) {
      GetIt.instance.registerSingleton<Settings>(Settings());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) =>
              SplashCubit(GetIt.instance.get<Settings>())..loadSettings(),
        ),
        BlocProvider<PomoCubit>(
          create: (context) => PomoCubit(GetIt.instance.get<Settings>()),
        ),
      ],
      child: MaterialApp(
        title: 'Pomo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
          brightness: Brightness.light,
          textTheme: TextStyles.lightTheme,
        ),
        // darkTheme: ThemeData(
        //   useMaterial3: true,
        //   colorSchemeSeed: Colors.blue,
        //   brightness: Brightness.dark,
        //   textTheme: TextStyles.lightTheme,
        // ),
        home: const SplashPage(),
      ),
    );
  }
}
