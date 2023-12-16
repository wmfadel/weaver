import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/core/constants/strings.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:pomo/core/utils/logger.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this.settings) : super(SettingsInitial());

  Settings settings;

  /// Takes any value available in the [Settings] class and updates it.
  void updateSettings({
    int? focusLength,
    int? shortBreakLength,
    int? longBreakLength,
    int? pomosCount,
    bool? autoResumeTimer,
    bool? enableNotifications,
    bool? enableSounds,
  }) {
    settings = settings.copyWith(
      focusLength: focusLength,
      shortBreakLength: shortBreakLength,
      longBreakLength: longBreakLength,
      pomosCount: pomosCount,
      autoResumeTimer: autoResumeTimer,
      enableNotifications: enableNotifications,
      enableSounds: enableSounds,
    );
    _persistSettings(settings);
    emit(SettingsUpdate(settings));
  }

  _persistSettings(Settings settings)async{
    try{
      const storage = FlutterSecureStorage();
      storage.write(key: AppStrings.settingsKey, value: jsonEncode(settings.toJson()));
    }catch(e){
      AppLog.e("failed to update settings $e");
    }
  }
}
