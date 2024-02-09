import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaver/features/pomo/controllers/pomo_cubit.dart';
import 'package:weaver/features/splash/controllers/splash_cubit.dart';
import 'package:weaver/features/splash/pages/splash_page.dart';

import 'core/constants/styles.dart';

class WeaverApp extends StatefulWidget {
  const WeaverApp({super.key});

  @override
  State<WeaverApp> createState() => _WeaverAppState();
}

class _WeaverAppState extends State<WeaverApp> {
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
