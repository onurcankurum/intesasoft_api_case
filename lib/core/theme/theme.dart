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
      primaryColorDark: const Color(0xFFad5552),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: Colors.red, // but now it should be declared like this
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black54, size: 35)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: const BorderSide(color: Colors.red)),
              primary: const Color(0xFFe40022))));

  AppThemeLight._init();
}
