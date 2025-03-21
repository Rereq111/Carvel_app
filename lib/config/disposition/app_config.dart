import 'package:flutter/services.dart';

class AppConfig {
  static const bool isPortraitModeOnly = true;

  static Future<void> initializeApp() async {
    if (isPortraitModeOnly) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    } else {
      // Permitir ambas orientaciones
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
  }
}
