import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/storage/cache_helper.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _language = const Locale('en');

  Locale get language => _language;

  Future<void> loadLocale() async {
    final savedLocale = CacheHelper.getString(key: AppStrings.languageKey);
    if (savedLocale == AppStrings.arabic) {
      _language = Locale('ar');
    } else {
      _language = Locale('en');
    }

    notifyListeners();
  }

  Future<void> changeLocale(Locale locale) async {
    _language = locale;
    await CacheHelper.saveData(
      key: AppStrings.languageKey,
      value: locale.languageCode,
    );

    notifyListeners();
  }
}
