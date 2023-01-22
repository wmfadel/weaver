part of 'splash_cubit.dart';

abstract class SplashState {}

class SplashLoading extends SplashState {}

class SplashCompleted extends SplashState {
  final Settings settings;

  SplashCompleted(this.settings);
}
