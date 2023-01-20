import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/home/pages/home_page.dart';
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
    return MaterialApp(
      title: 'Pomo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        brightness: Brightness.light,
      ),
      // darkTheme: ThemeData(
      //   useMaterial3: true,
      //   colorSchemeSeed: Colors.blue,
      //   brightness: Brightness.dark,
      // ),
      home: const HomePage(),
    );
  }
}
