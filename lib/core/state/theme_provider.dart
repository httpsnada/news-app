import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/storage/cache_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadTheme() async {
    final savedTheme = CacheHelper.getString(key: AppStrings.themeKey);
    if (savedTheme == AppStrings.darkMode) {
      _themeMode = ThemeMode.dark;
    } else {
      _themeMode = ThemeMode.light;
    }

    notifyListeners();
  }

  Future<void> changeTheme(ThemeMode mode) async {
    _themeMode = mode;
    await CacheHelper.saveData(
      key: AppStrings.themeKey,
      value: mode == ThemeMode.dark
          ? AppStrings.darkMode
          : AppStrings.lightMode,
    );

    notifyListeners();
  }
}
