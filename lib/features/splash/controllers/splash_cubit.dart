import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:pomo/core/utils/cached_settings.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this.settings, {
    @visibleForTesting CachedSettings? cachedSettings,
  })  : _cachedSettings = cachedSettings ?? CachedSettings(),
        super(SplashLoading());
  Settings settings;
  final CachedSettings _cachedSettings;

  Future<void> loadSettings() async {
    settings = await _cachedSettings.loadSettings() ?? const Settings();
    emit(SplashCompleted(settings));
  }
}
