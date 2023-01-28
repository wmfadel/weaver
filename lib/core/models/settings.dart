import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final int focusLength;
  final int shortBreakLength;
  final int longBreakLength;
  final int pomosCount;
  final bool autoResumeTimer;
  final bool enableNotifications;
  final bool enableSounds;

  const Settings({
    this.focusLength = 25 * 60,
    this.shortBreakLength = 5 * 60,
    this.longBreakLength = 30 * 60,
    this.pomosCount = 4,
    this.autoResumeTimer = false,
    this.enableNotifications = true,
    this.enableSounds = false,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      focusLength: json['focusLength'],
      shortBreakLength: json['shortBreakLength'],
      longBreakLength: json['longBreakLength'],
      pomosCount: json['pomosCount'],
      autoResumeTimer: json['autoResumeTimer'],
      enableNotifications: json['enableNotifications'],
      enableSounds: json['enableSounds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'focusLength': focusLength,
      'shortBreakLength': shortBreakLength,
      'longBreakLength': longBreakLength,
      'pomosCount': pomosCount,
      'autoResumeTimer': autoResumeTimer,
      'enableNotifications': enableNotifications,
      'enableSounds': enableSounds,
    };
  }

  Settings copyWith({
    int? focusLength,
    int? shortBreakLength,
    int? longBreakLength,
    int? pomosCount,
    bool? autoResumeTimer,
    bool? enableNotifications,
    bool? enableSounds,
  }) {
    return Settings(
      focusLength: focusLength ?? this.focusLength,
      shortBreakLength: shortBreakLength ?? this.shortBreakLength,
      longBreakLength: longBreakLength ?? this.longBreakLength,
      pomosCount: pomosCount ?? this.pomosCount,
      autoResumeTimer: autoResumeTimer ?? this.autoResumeTimer,
      enableNotifications: enableNotifications ?? this.enableNotifications,
      enableSounds: enableSounds ?? this.enableSounds,
    );
  }

  @override
  List<Object?> get props => [
        focusLength,
        shortBreakLength,
        longBreakLength,
        pomosCount,
        autoResumeTimer,
        enableNotifications,
        enableSounds,
      ];
}
