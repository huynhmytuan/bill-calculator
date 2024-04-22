import 'package:bill_calculator/configs/themes/color_schemes.g.dart';
import 'package:bill_calculator/utils/color_ext.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final baseThemeData = ThemeData();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        colorScheme: lightColorScheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey.shade100),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        colorScheme: darkColorScheme,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: darkColorScheme.primaryContainer.lighten(.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: darkColorScheme.primaryContainer.lighten(.1),
            ),
          ),
        ),
      );
}
