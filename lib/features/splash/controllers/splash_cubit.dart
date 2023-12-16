import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:pomo/core/constants/strings.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/core/utils/logger.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashLoading());

  Future<void> loadSettings() async {
    const storage = FlutterSecureStorage();
    Settings settings = const Settings();
    try {
      String? value = await storage.read(key: AppStrings.settingsKey);
      if (value != null) settings = Settings.fromJson(jsonDecode(value));
    } on Exception catch (e) {
      AppLog.e(
          'Failed to load settings $e, using default ${settings.toJson()}');
    }
    emit(SplashCompleted(settings));
  }
}
