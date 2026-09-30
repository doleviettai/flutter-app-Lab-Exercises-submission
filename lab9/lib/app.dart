import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';

/// Root application widget for Lab 9 - Clima.
class ClimaApp extends StatelessWidget {
  const ClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 9 - Clima Weather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LoadingScreen(),
    );
  }
}