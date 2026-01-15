import 'package:flutter/material.dart';

abstract class AppThemes {
  static final Color _lightThemeColor = Colors.white;
  static final Color _darkThemeColor = Colors.black;

  static final ThemeData ligthTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _lightThemeColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ligthTheme.colorScheme.onPrimary),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _darkThemeColor),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: ligthTheme.colorScheme.onPrimary),
    ),
  );
}
