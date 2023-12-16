import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/models/settings.dart';

part 'pomo_state.dart';

class PomoCubit extends Cubit<PomoState> {
  Settings? _settings;
  int _focusPomosCount = 0;
  Timer? _timer;
  late int _currentProgress;

  PomoCubit() : super(const FocusPomo());

  set settings(Settings settings) {
    _settings = settings;
    if (!state.playing) {
      _currentProgress = settings.focusLength;
      emit(FocusPomo(playing: false, progress: _currentProgress));
    }
  }

  Settings get settings => _settings ?? const Settings();

  startFocusPomo() {
    _settings ??= const Settings();
    if (_timer == null) _focusPomosCount++;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = _settings!.shortBreakLength;
          if (_focusPomosCount == _settings!.pomosCount) {
            _focusPomosCount = 0;
            _currentProgress = _settings!.longBreakLength;
            emit(LongBreakPomo(playing: false, progress: _currentProgress));
          } else {
            _currentProgress = _settings!.shortBreakLength;
            emit(BreakPomo(playing: false, progress: _currentProgress));
          }
        } else {
          emit(FocusPomo(playing: true, progress: --_currentProgress));
        }
      },
    );
  }

  startShortBreak() {
    _settings ??= const Settings();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = _settings!.focusLength;
          emit(FocusPomo(playing: false, progress: _currentProgress));
        } else {
          emit(BreakPomo(playing: true, progress: --_currentProgress));
        }
      },
    );
  }

  startLongBreak() {
    _settings ??= const Settings();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = _settings!.focusLength;
          emit(FocusPomo(playing: false, progress: _currentProgress));
        } else {
          emit(LongBreakPomo(playing: true, progress: --_currentProgress));
        }
      },
    );
  }

  bool get isPlaying => _timer == null ? false : _timer!.isActive;

  toggle() {
    if (isPlaying) {
      _timer!.cancel();
      emit(state.copyWith(playing: false));
    } else {
      emit(state.copyWith(playing: true, progress: --_currentProgress));
      if (state is FocusPomo) {
        startFocusPomo();
      } else if (state is BreakPomo) {
        startShortBreak();
      } else {
        startLongBreak();
      }
    }
  }

  skip() {
    _settings ??= const Settings();
    _timer?.cancel();
    _timer = null;
    if (state is FocusPomo) {
      if (_focusPomosCount == _settings!.pomosCount) {
        _focusPomosCount = 0;
        _currentProgress = _settings!.longBreakLength;
        emit(LongBreakPomo(playing: false, progress: _currentProgress));
      } else {
        _currentProgress = _settings!.shortBreakLength;
        emit(BreakPomo(playing: false, progress: _currentProgress));
      }
    } else {
      _focusPomosCount++;
      _currentProgress = _settings!.focusLength;
      emit(FocusPomo(playing: false, progress: _currentProgress));
    }
  }

  Color get textColor {
    return state is FocusPomo
        ? AppColors.red900
        : state is BreakPomo
            ? AppColors.green900
            : AppColors.blue900;
  }

  Color get backgroundColor {
    return state is FocusPomo
        ? AppColors.red50
        : state is BreakPomo
            ? AppColors.green50
            : AppColors.blue50;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    _timer = null;
    return super.close();
  }
}
