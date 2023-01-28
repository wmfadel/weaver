part of 'settings_cubit.dart';

abstract class SettingsState extends Equatable {}

class SettingsInitial extends SettingsState {
  @override
  List<Object?> get props => [];
}
class SettingsUpdate extends SettingsState {
  SettingsUpdate(this.settings);

  final Settings settings;

  @override
  List<Object?> get props => [settings];
}
