import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final baseThemeData = ThemeData();

  static ThemeData get lightTheme => FlexThemeData.light(
        scheme: FlexScheme.greenM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        subThemesData: FlexSubThemesData(
          dialogElevation: 0,
          blendOnLevel: 10,
          defaultRadius: 20,
          blendOnColors: true,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          filledButtonRadius: 40,
          dialogBackgroundSchemeColor: SchemeColor.surface,
          useInputDecoratorThemeInDialogs: true,
          inputDecoratorUnfocusedBorderIsColored: false,
          inputDecoratorUnfocusedHasBorder: false,
          inputDecoratorFillColor: Colors.grey.shade200,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );

  static ThemeData get darkTheme => FlexThemeData.dark(
        scheme: FlexScheme.greenM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        subThemesData: const FlexSubThemesData(
          dialogElevation: 0,
          blendOnLevel: 20,
          useTextTheme: true,
          defaultRadius: 20,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        keyColors: const FlexKeyColors(),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      );
}
