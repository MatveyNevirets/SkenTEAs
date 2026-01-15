import 'package:flutter/material.dart';

abstract class AppThemes {
  static final Color _lightThemeColor = Colors.green;
  static final Color _darkThemeColor = Colors.black;

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _lightThemeColor),
  );
  static final ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _darkThemeColor),
  );
}

class SomeScreen extends StatelessWidget {
  const SomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(
      context,
    ).colorScheme; // Здесь мы получаем список всех сгенерированных цветов

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: colorScheme.tertiary, // Здесь мы уже установили базовый цвет
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        child: Text("HI BRO"),
      ),
    );
  }
}
