class Settings {
  int focusLength;
  int shortBreakLength;
  int longBreakLength;
  int pomosCount;
  bool autoResumeTimer;
  bool enableNotifications;
  bool enableSounds;

  Settings({
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

}
