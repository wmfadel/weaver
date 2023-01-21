class Settings {
  int focusLength;

  int shortBreakLength;
  int longBreakLength;
  int pomosCount;
  bool autoResumeTimer;
  bool enableNotifications;
  bool enableSounds;

  Settings({
    this.focusLength = 15 * 60,
    this.shortBreakLength = 5 * 60,
    this.longBreakLength = 10 * 60,
    this.pomosCount = 4,
    this.autoResumeTimer = false,
    this.enableNotifications = true,
    this.enableSounds = false,
  });
}
