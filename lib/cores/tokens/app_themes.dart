import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppThemes {
  static const String fontFamily = "NanumSquare";
  static const List<String> fontFamilyFallback = [];

  static const ThemeMode themeMode = ThemeMode.light;
  static final ThemeData themeData = ThemeData(
    // useMaterial3: false,
    fontFamily: fontFamily,
    // fontFamilyFallback: fontFamilyFallback,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    appBarTheme: appBarTheme,
    colorScheme: colorScheme,
    // fontFamilyFallback: [],
  );

  static Color get scaffoldBackgroundColor => AppColors.white;
  static ColorScheme get colorScheme => const ColorScheme.light();

  static final AppBarTheme appBarTheme = const AppBarTheme().copyWith(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.black,
  );
}
