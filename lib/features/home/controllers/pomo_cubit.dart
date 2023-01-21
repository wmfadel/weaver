import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/models/settings.dart';

part 'pomo_state.dart';

class PomoCubit extends Cubit<PomoState> {
  final Settings settings;
  int _focusPomosCount = 0;
  Timer? _timer;
  late int _currentProgress;

  PomoCubit(this.settings) : super(const FocusPomo()) {
    _currentProgress = settings.focusLength;
    //
    // emit(FocusPomo(
    //     playing: _stopWatchTimer.isRunning,
    //     progress: _formatTimeValue(_stopWatchTimer.rawTime.value)));
    // log('in constructor ${state.toString()}');
    // _stopWatchTimer.fetchEnded.listen((bool value) {
    //   /// check value is true, means timer is ended.
    //   /// if the current step is focus,
    //   /// if it is the last focus, then start long break else start short break
    //   /// if the current step is break or long break, then start focus
    //   if (value) {
    //     if (state is FocusPomo) {
    //       if (settings.pomosCount == _focusPomosCount) {
    //         /// start long break
    //         log('starting a long break after finished');
    //         // startLongBreak();
    //         emit(LongBreakPomo(
    //             playing: _stopWatchTimer.isRunning,
    //             progress: _formatTimeValue(settings.longBreakLength)));
    //       } else {
    //         /// start short break
    //         log('starting a short break after finished');
    //         emit(BreakPomo(
    //             playing: _stopWatchTimer.isRunning,
    //             progress: _formatTimeValue(settings.shortBreakLength)));
    //       }
    //     } else {
    //       log('starting focus after finished');
    //       emit(FocusPomo(
    //           playing: _stopWatchTimer.isRunning,
    //           progress: _formatTimeValue(settings.focusLength)));
    //     }
    //   }
    // });
  }

  startFocusPomo() {
    if (_timer == null) _focusPomosCount++;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = settings.shortBreakLength;
          if (_focusPomosCount == settings.pomosCount) {
            _focusPomosCount = 0;
            _currentProgress = settings.longBreakLength;
            emit(LongBreakPomo(playing: true, progress: _currentProgress));
          } else {
            _currentProgress = settings.shortBreakLength;
            emit(BreakPomo(playing: true, progress: _currentProgress));
          }
        } else {
          emit(FocusPomo(playing: true, progress: --_currentProgress));
        }
      },
    );

    // _stopWatchTimer.setPresetSecondTime(settings.focusLength, add: false);
    // if (settings.autoResumeTimer) {
    //   _stopWatchTimer.onStartTimer();
    // }
    // _focusPomosCount++;
    // _stopWatchTimer.rawTime.listen(
    //   (value) => emit(
    //     FocusPomo(
    //         playing: _stopWatchTimer.isRunning,
    //         progress: _formatTimeValue(value)),
    //   ),
    // );
  }

  startShortBreak() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = settings.focusLength;
          emit(FocusPomo(playing: true, progress: _currentProgress));
        } else {
          emit(BreakPomo(playing: true, progress: --_currentProgress));
        }
      },
    );
    // _stopWatchTimer.setPresetSecondTime(settings.shortBreakLength, add: false);
    // if (settings.autoResumeTimer) _stopWatchTimer.onStartTimer();
    //
    // _stopWatchTimer.rawTime.listen(
    //   (value) => emit(
    //     BreakPomo(
    //         playing: _stopWatchTimer.isRunning,
    //         progress: _formatTimeValue(value)),
    //   ),
    // );
  }

  startLongBreak() {
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (_currentProgress == 0) {
          _timer?.cancel();
          _timer = null;
          _currentProgress = settings.focusLength;
          emit(FocusPomo(playing: true, progress: _currentProgress));
        } else {
          emit(LongBreakPomo(playing: true, progress: --_currentProgress));
        }
      },
    );
    // _stopWatchTimer.setPresetSecondTime(settings.longBreakLength, add: false);
    // if (settings.autoResumeTimer) _stopWatchTimer.onStartTimer();
    // _focusPomosCount = 0;
    // _stopWatchTimer.rawTime.listen(
    //   (value) => emit(
    //     LongBreakPomo(
    //         playing: _stopWatchTimer.isRunning,
    //         progress: _formatTimeValue(value)),
    //   ),
    // );
  }

  bool get isPlaying => _timer == null ? false : _timer!.isActive;

  next() {
    if (isPlaying) {
      _timer!.cancel();
      emit(state.copyWith(playing: false));
    } else {
      if (state is FocusPomo) {
        startFocusPomo();
      } else if (state is BreakPomo) {
        startShortBreak();
      } else {
        startLongBreak();
      }
    }
  }

  // String _formatTimeValue(int value) {
  // return StopWatchTimer.getDisplayTime(
  //   value,
  //   hours: false,
  //   milliSecond: false,
  // );
  // }

  @override
  Future<void> close() {
    // _stopWatchTimer.dispose();
    return super.close();
  }
}
