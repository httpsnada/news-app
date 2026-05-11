import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colors => Theme.of(this).colorScheme;

  TextTheme get text => Theme.of(this).textTheme;
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension ContextExtension on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this)!;
  }
}

extension StringtoDate on String {
  String formatNewsDate() {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'hh:mm:ss");
    DateTime dateTime = inputFormat.parse(this);
    DateFormat outputFormat = DateFormat("EEE, MMM d,yyyy");
    return outputFormat.format(dateTime);
  }
}
