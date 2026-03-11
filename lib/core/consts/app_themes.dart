import 'package:flutter/material.dart';

abstract class AppThemes {
  static final Color _lightThemeColor = const Color.fromARGB(
    255,
    255,
    255,
    255,
  );

  static final Color _darkThemeColor = const Color.fromARGB(255, 0, 0, 0);

  static final ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: _lightThemeColor),
    scaffoldBackgroundColor: Color.fromRGBO(229, 220, 203, 255),
    primaryColorDark: Color.fromRGBO(59, 52, 44, 255),
    hintColor: Color.fromRGBO(195, 186, 171, 255),
    hoverColor: Color.fromRGBO(183, 174, 157, 255),
    splashColor: Color.fromRGBO(26, 54, 29, 255),
    highlightColor: Color.fromRGBO(165, 158, 145, 255),
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
