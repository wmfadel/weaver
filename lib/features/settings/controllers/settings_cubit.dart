import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomo/core/models/settings.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(Settings settings)
      : _settings = settings,
        super(SettingsInitial());

  Settings _settings;

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
    emit(SettingsUpdate(_settings));
  }
}
