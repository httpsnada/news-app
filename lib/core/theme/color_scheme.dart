import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';

class ThemeColors {
  static var lightScheme = ColorScheme.light(
    primary: AppColors.light,
    onPrimary: AppColors.dark,
    surface: AppColors.dark,
    onSurface: AppColors.light,
    secondary: AppColors.text,
  );

  static var darkScheme = ColorScheme.dark(
    primary: AppColors.dark,
    onPrimary: AppColors.light,
    surface: AppColors.light,
    onSurface: AppColors.dark,
    secondary: AppColors.text,
  );
}
