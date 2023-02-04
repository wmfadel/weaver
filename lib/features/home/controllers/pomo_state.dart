part of 'pomo_cubit.dart';

abstract class PomoState extends Equatable {
  final bool playing;

  final int progress;

  final TimerStates previousState;
  final bool stateAfterSkip;

  PomoState copyWith(
      {bool? playing, int? progress, TimerStates? previousState, bool? stateAfterSkip});

  const PomoState(
      {this.playing = false,
      this.progress = 0,
      this.previousState = TimerStates.idle,
      this.stateAfterSkip = false});

  @override
  List<Object> get props => [playing, progress, previousState, stateAfterSkip];
}

class FocusPomo extends PomoState {
  const FocusPomo({super.playing, super.progress, super.previousState, super.stateAfterSkip});

  @override
  List<Object> get props => [playing, progress, previousState, stateAfterSkip];

  @override
  PomoState copyWith(
      {bool? playing, int? progress, TimerStates? previousState, bool? stateAfterSkip}) {
    return FocusPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
      previousState: previousState ?? this.previousState,
      stateAfterSkip: stateAfterSkip ?? this.stateAfterSkip,
    );
  }
}

class BreakPomo extends PomoState {
  const BreakPomo({super.playing, super.progress, super.previousState, super.stateAfterSkip});

  @override
  PomoState copyWith(
      {bool? playing, int? progress, TimerStates? previousState, bool? stateAfterSkip}) {
    return BreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
      previousState: previousState ?? this.previousState,
      stateAfterSkip: stateAfterSkip ?? this.stateAfterSkip,
    );
  }

  @override
  List<Object> get props => [playing, progress, previousState, stateAfterSkip];
}

class LongBreakPomo extends PomoState {
  const LongBreakPomo({super.playing, super.progress, super.previousState, super.stateAfterSkip});

  @override
  PomoState copyWith(
      {bool? playing, int? progress, TimerStates? previousState, bool? stateAfterSkip}) {
    return LongBreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
      previousState: previousState ?? this.previousState,
      stateAfterSkip: stateAfterSkip ?? this.stateAfterSkip,
    );
  }

  @override
  List<Object> get props => [playing, progress, previousState, stateAfterSkip];
}
