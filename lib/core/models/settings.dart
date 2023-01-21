class Settings {
  int focusLength;

  int shortBreakLength;
  int longBreakLength;
  int pomosCount;
  bool autoResumeTimer;
  bool enableNotifications;
  bool enableSounds;

  Settings({
    this.focusLength = 15,
    this.shortBreakLength = 5,
    this.longBreakLength = 10,
    this.pomosCount = 4,
    this.autoResumeTimer = false,
    this.enableNotifications = true,
    this.enableSounds = false,
  });
}
