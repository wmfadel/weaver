import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashCubit>(
          create: (context) => SplashCubit()..loadSettings(),
        ),
        BlocProvider<PomoCubit>(create: (context) => PomoCubit()),
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
