part of 'pomo_cubit.dart';

abstract class PomoState extends Equatable {
  final bool playing;

  final String progress;
  final Color color = AppColors.red50;

  PomoState copyWith({bool? playing, String? progress});

  const PomoState({this.playing = false, this.progress = '00:00'});

  @override
  List<Object> get props => [playing, progress, color];
}

class FocusPomo extends PomoState {
  const FocusPomo({super.playing, super.progress});

  @override
  List<Object> get props => [playing, progress, color];

  @override
  PomoState copyWith({bool? playing, String? progress}) {
    return FocusPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }
}

class BreakPomo extends PomoState {
  @override
  final Color color = AppColors.green50;

  const BreakPomo({super.playing, super.progress});

  @override
  PomoState copyWith({bool? playing, String? progress}) {
    return BreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [playing, progress, color];
}

class LongBreakPomo extends PomoState {
  @override
  final Color color = AppColors.blue50;

  const LongBreakPomo({super.playing, super.progress});

  @override
  PomoState copyWith({bool? playing, String? progress}) {
    return LongBreakPomo(
      playing: playing ?? this.playing,
      progress: progress ?? this.progress,
    );
  }

  @override
  List<Object> get props => [playing, progress, color];
}
