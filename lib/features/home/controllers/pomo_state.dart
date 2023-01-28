part of 'pomo_cubit.dart';

abstract class PomoState extends Equatable {
  final bool playing;

  final int progress;

  PomoState copyWith({bool? playing, int? progress});

  const PomoState({this.playing = false, this.progress = 0});

  @override
  List<Object> get props => [playing, progress];
}

class FocusPomo extends PomoState {
  const FocusPomo({super.playing, super.progress});

  @override
  List<Object> get props => [playing, progress];

  @override
  PomoState copyWith({bool? playing, int? progress}) {
    return FocusPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }
}

class BreakPomo extends PomoState {
  const BreakPomo({super.playing, super.progress});

  @override
  PomoState copyWith({bool? playing, int? progress}) {
    return BreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [playing, progress];
}

class LongBreakPomo extends PomoState {
  const LongBreakPomo({super.playing, super.progress});

  @override
  PomoState copyWith({bool? playing, int? progress}) {
    return LongBreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [playing, progress];
}
