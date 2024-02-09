import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:weaver/core/constants/strings.dart';
import 'package:weaver/core/models/settings.dart';
import 'package:weaver/core/utils/logger.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(Settings settings)
      : _settings = settings,
        super(SettingsInitial());

  Settings _settings;

  Settings get settings => _settings;

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
    _settings = _settings.copyWith(
      focusLength: focusLength,
      shortBreakLength: shortBreakLength,
      longBreakLength: longBreakLength,
      pomosCount: pomosCount,
      autoResumeTimer: autoResumeTimer,
      enableNotifications: enableNotifications,
      enableSounds: enableSounds,
    );
    _persistSettings(_settings);
    emit(SettingsUpdate(_settings));
  }

  _persistSettings(Settings settings) async {
    try {
      const storage = FlutterSecureStorage();
      storage.write(
          key: AppStrings.settingsKey, value: jsonEncode(settings.toJson()));

      String? value = await storage.read(key: AppStrings.settingsKey);
      Settings? temp;
      if (value != null) temp = Settings.fromJson(jsonDecode(value));
      AppLog.v(temp);
    } catch (e) {
      AppLog.e("failed to update settings $e");
    }
  }
}
