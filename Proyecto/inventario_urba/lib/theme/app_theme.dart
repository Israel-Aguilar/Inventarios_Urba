import 'package:flutter/material.dart';

class AppTheme{

  static const Color primary=Color(0xFF225A4D);

  static final ThemeData lightTheme= ThemeData.light().copyWith(
        primaryColor: primary,
        appBarTheme: const AppBarTheme(
          color:primary,
          elevation: 0,
          
        ),
        
      );

}