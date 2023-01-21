import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomo/core/constants/colors.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'pomo_state.dart';

class PomoCubit extends Cubit<PomoState> {
  final Settings settings;
  final StopWatchTimer _stopWatchTimer =
      StopWatchTimer(mode: StopWatchMode.countDown);
  int _focusPomosCount = 0;

  PomoCubit(this.settings) : super(const FocusPomo()) {
    _stopWatchTimer.setPresetSecondTime(settings.focusLength, add: false);
    emit(FocusPomo(
        playing: _stopWatchTimer.isRunning,
        progress: _formatTimeValue(_stopWatchTimer.rawTime.value)));
    log('in constructor ${state.toString()}');
    _stopWatchTimer.fetchEnded.listen((bool value) {
      /// check value is true, means timer is ended.
      /// if the current step is focus,
      /// if it is the last focus, then start long break else start short break
      /// if the current step is break or long break, then start focus
      if (value) {
        if (state is FocusPomo) {
          if (settings.pomosCount == _focusPomosCount) {
            /// start long break
            log('starting a long break after finished');
            // startLongBreak();
            emit(LongBreakPomo(
                playing: _stopWatchTimer.isRunning,
                progress: _formatTimeValue(settings.longBreakLength)));
          } else {
            /// start short break
            log('starting a short break after finished');
            emit(BreakPomo(
                playing: _stopWatchTimer.isRunning,
                progress: _formatTimeValue(settings.shortBreakLength)));
          }
        } else {
          log('starting focus after finished');
          emit(FocusPomo(
              playing: _stopWatchTimer.isRunning,
              progress: _formatTimeValue(settings.focusLength)));
        }
      }
    });
  }

  startFocusPomo() {
    _stopWatchTimer.setPresetSecondTime(settings.focusLength, add: false);
    if (settings.autoResumeTimer) {
      _stopWatchTimer.onStartTimer();
    }
    _focusPomosCount++;
    _stopWatchTimer.rawTime.listen(
      (value) => emit(
        FocusPomo(
            playing: _stopWatchTimer.isRunning,
            progress: _formatTimeValue(value)),
      ),
    );
  }

  startShortBreak() {
    _stopWatchTimer.setPresetSecondTime(settings.shortBreakLength, add: false);
    if (settings.autoResumeTimer) _stopWatchTimer.onStartTimer();

    _stopWatchTimer.rawTime.listen(
      (value) => emit(
        BreakPomo(
            playing: _stopWatchTimer.isRunning,
            progress: _formatTimeValue(value)),
      ),
    );
  }

  startLongBreak() {
    _stopWatchTimer.setPresetSecondTime(settings.longBreakLength, add: false);
    if (settings.autoResumeTimer) _stopWatchTimer.onStartTimer();
    _focusPomosCount = 0;
    _stopWatchTimer.rawTime.listen(
      (value) => emit(
        LongBreakPomo(
            playing: _stopWatchTimer.isRunning,
            progress: _formatTimeValue(value)),
      ),
    );
  }

  bool get isPlaying => state.playing;

  next() {
    // /// if playing then pause, else start
    if (isPlaying) {
      _stopWatchTimer.onStopTimer();
      emit(state.copyWith(playing: false));
    } else {
      _stopWatchTimer.onStartTimer();
      emit(state.copyWith(playing: true));
    }
  }

  String _formatTimeValue(int value) {
    return StopWatchTimer.getDisplayTime(
      value,
      hours: false,
      milliSecond: false,
    );
  }

  @override
  Future<void> close() {
    _stopWatchTimer.dispose();
    return super.close();
  }
}
