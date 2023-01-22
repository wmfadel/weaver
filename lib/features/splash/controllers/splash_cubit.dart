import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  final String _settingsKey = 'settings';

  Future<void> loadSettings() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: _settingsKey);
    if (value == null) {
      emit(SplashCompleted(Settings()));
    } else {
      emit(SplashCompleted(Settings.fromJson(jsonDecode(value))));
    }
  }
}
