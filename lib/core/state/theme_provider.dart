import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void changeTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}