import 'package:dash_dashboard/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.foreGroundColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 100,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: AppColors.white,
      ),
      bodyMedium: TextStyle(fontSize: 12, color: AppColors.white),
    ),
    // colorScheme:
    // ColorScheme.fromSwatch().copyWith(secondary: AppColors.accentColor),
  );
}