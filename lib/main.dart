import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomo/features/splash/controllers/splash_cubit.dart';
import 'package:pomo/features/splash/pages/splash_page.dart';

import 'core/constants/styles.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const PomoApp());
}

class PomoApp extends StatelessWidget {
  const PomoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
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
      home: BlocProvider<SplashCubit>(
        create: (context) => SplashCubit()..loadSettings(),
        child: const SplashPage(),
      ),
    );
  }
}
