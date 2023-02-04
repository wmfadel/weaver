import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pomo/core/models/settings.dart';
import 'package:pomo/core/utils/logger.dart';

class CachedSettings {
  final String _settingsKey = 'settings';

  Future<Settings?> loadSettings() async {
    try {
      const storage = FlutterSecureStorage();
      String? value = await storage.read(key: _settingsKey);
      return Settings.fromJson(jsonDecode(value ?? ''));
    } catch (e) {
      AppLog.e(e);
      return null;
    }
  }

  Future<void> saveSettings(Settings settings) async {
    const storage = FlutterSecureStorage();
    await storage.write(
      key: _settingsKey,
      value: jsonEncode(settings.toJson()),
    );
  }
}
