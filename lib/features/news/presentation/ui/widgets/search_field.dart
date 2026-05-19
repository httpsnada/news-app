import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';

import '../../../../../core/utils/spacing.dart';

class SearchField extends StatelessWidget {
  String hintText;
  TextStyle? hintStyle;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextInputType keyboardType;
  TextEditingController? controller;
  final ValueChanged<String>? onFieldSubmitted;

  SearchField({
    super.key,
    required this.hintText,
    required this.hintStyle,
    required this.prefixIcon,
    required this.suffixIcon,
    this.keyboardType = TextInputType.text,
    required this.controller,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: true,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: BorderSide(color: context.colors.secondary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          borderSide: BorderSide(color: context.colors.onPrimary, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
      ),
    );
  }
}
