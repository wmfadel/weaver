import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:pomo/core/utils/cached_settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    this.settings, {
    @visibleForTesting CachedSettings? cachedSettings,
  })  : _cachedSettings = cachedSettings ?? CachedSettings(),
        super(SettingsInitial());

  Settings settings;
  final CachedSettings _cachedSettings;

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
    _cachedSettings.saveSettings(settings);
    emit(SettingsUpdate(settings));
  }
}
