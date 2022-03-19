import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppThemeLight {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance == null) {
      SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(statusBarColor: Colors.white));
      _instance = AppThemeLight._init();
      return _instance!;
    }
    return _instance!;
  }

  ThemeData get theme => ThemeData(
        scaffoldBackgroundColor: const Color(0xFFfaefef),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        backgroundColor: Colors.red, // Status bar color
        iconTheme: const IconThemeData(color: Colors.black54));

  AppThemeLight._init();
}
