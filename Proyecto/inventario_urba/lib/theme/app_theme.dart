import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF225A4D);
  static Color primary_shade(double gradient) {
    return Color.fromRGBO(34, 90, 77, gradient);
  }

  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(
        color: primary,
        elevation: 0,
      ),
      dividerTheme: DividerThemeData(
        thickness: 1.5,
        color: primary_shade(190),
      ));
}
