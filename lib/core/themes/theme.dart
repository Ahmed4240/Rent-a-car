import 'package:flutter/material.dart';
import 'package:rent_a_car/core/themes/app_pallete.dart';

class AppTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(color: AppPallete.backgroundColor),
      scaffoldBackgroundColor: AppPallete.backgroundColor);
}
