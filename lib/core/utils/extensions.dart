import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension ThemeExtension on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension StringtoDate on String {
  String formatNewsDate() {
    DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'hh:mm:ss");
    DateTime dateTime = inputFormat.parse(this);
    DateFormat outputFormat = DateFormat("EEE, MMM d,yyyy");
    return outputFormat.format(dateTime);
  }
}
