import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBg = Color(0xFF0D1B2A);
  static const Color cardBg = Color(0xDD1B263B);
  static const Color accent = Color(0xFF00B4D8);
  static const Color inputBg = Color(0xFF1B263B);

  static const LinearGradient dayGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1E3C72),
      Color(0xFF2A5298),
      Color(0xFF0D1B2A),
    ],
  );
}
