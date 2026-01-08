import 'package:flutter/material.dart';
import 'package:skenteas/feature/home/presentation/home_screen.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 22, 23, 24),
      ),
      home: HomeScreen(),
    );
  }
}
