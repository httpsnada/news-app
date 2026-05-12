import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../features/news/data/models/categories/category_model.dart';
import '../../l10n/app_localizations.dart';

// Theme
extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

// Localization
extension ContextExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}

// Category Model Extension
extension CategoryLocalization on CategoryModel {
  String localizedName(BuildContext context) {
    switch (id) {
      case 'general':
        return context.l10n.general;

      case 'business':
        return context.l10n.business;

      case 'entertainment':
        return context.l10n.entertainment;

      case 'health':
        return context.l10n.health;

      case 'science':
        return context.l10n.science;

      case 'technology':
        return context.l10n.technology;

      case 'sports':
        return context.l10n.sports;

      default:
        return id;
    }
  }
}

// Get Language Code
extension LocaleExtension on Locale {
  String get apiLanguageCode {
    return languageCode;
  }
}

// DateFormat
extension StringtoDate on String {
  String formatNewsDate() {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'hh:mm:ss");
    DateTime dateTime = inputFormat.parse(this);
    DateFormat outputFormat = DateFormat("EEE, MMM d,yyyy");
    return outputFormat.format(dateTime);
  }
}
