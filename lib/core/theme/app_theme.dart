import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.dark,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: AppColors.light,
    brightness: Brightness.light,

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.dark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.dark,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.light,
        backgroundColor: AppColors.dark,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: AppColors.light,
      foregroundColor: AppColors.dark,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.dark,
      ),
      centerTitle: true,
    ),
  );

  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.dark,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: AppColors.dark,
    brightness: Brightness.dark,

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: AppColors.light,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.light,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.dark,
        backgroundColor: AppColors.light,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: AppColors.dark,
      foregroundColor: AppColors.light,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.light,
      ),
      centerTitle: true,
    ),
  );
}
