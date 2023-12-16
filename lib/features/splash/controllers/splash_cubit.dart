import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:pomo/core/constants/strings.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.settings) : super(SplashLoading());
  Settings settings;


  Future<void> loadSettings() async {
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: AppStrings.settingsKey);
    if (value != null) settings = Settings.fromJson(jsonDecode(value));
    emit(SplashCompleted(settings));
  }
}
