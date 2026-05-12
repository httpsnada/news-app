import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/state/language_provider.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/spacing.dart';

class LanguageDropDown extends StatelessWidget {
  const LanguageDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = context.select<LanguageProvider, Locale>(
      (provider) => provider.language,
    );
    final languageProvider = context.read<LanguageProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: AppColors.light),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Locale>(
          dropdownColor: AppColors.dark.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(AppSpacing.md),
          elevation: 2,
          value: locale,
          icon: Icon(Icons.expand_more, color: AppColors.light),
          items: [
            DropdownMenuItem(
              value: const Locale('ar'),
              child: Row(
                children: [
                  Icon(CupertinoIcons.globe, size: 20, color: AppColors.light),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    context.l10n.arabic,
                    style: TextStyle(color: AppColors.light),
                  ),
                ],
              ),
            ),

            DropdownMenuItem(
              value: const Locale('en'),
              child: Row(
                children: [
                  Icon(CupertinoIcons.globe, size: 20, color: AppColors.light),
                  SizedBox(width: AppSpacing.sm),
                  Text(
                    context.l10n.english,
                    style: TextStyle(color: AppColors.light),
                  ),
                ],
              ),
            ),
          ],
          onChanged: (locale) {
            if (locale != null) {
              languageProvider.changeLocale(locale);
            }
          },
        ),
      ),
    );
  }
}
