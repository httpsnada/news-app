import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

import 'color_scheme.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    colorScheme: ThemeColors.lightScheme,
    scaffoldBackgroundColor: AppColors.light,
    brightness: Brightness.light,

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ThemeColors.lightScheme.onPrimary,
        //color: AppColors.dark,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ThemeColors.lightScheme.onPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ThemeColors.lightScheme.secondary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ThemeColors.lightScheme.primary,
        backgroundColor: ThemeColors.lightScheme.onPrimary,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: ThemeColors.lightScheme.primary,
      foregroundColor: ThemeColors.lightScheme.onPrimary,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ThemeColors.lightScheme.onPrimary,
      ),
      centerTitle: true,
    ),
  );

  static var darkTheme = ThemeData(
    colorScheme: ThemeColors.darkScheme,
    // ColorScheme.fromSeed(
    //   seedColor: AppColors.dark,
    //   brightness: Brightness.dark,
    // ),
    scaffoldBackgroundColor: AppColors.dark,
    brightness: Brightness.dark,

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: ThemeColors.darkScheme.onPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ThemeColors.darkScheme.onPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: ThemeColors.darkScheme.secondary,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: ThemeColors.darkScheme.primary,
        backgroundColor: ThemeColors.darkScheme.onPrimary,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 3,
      backgroundColor: ThemeColors.darkScheme.primary,
      foregroundColor: ThemeColors.darkScheme.onPrimary,
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
