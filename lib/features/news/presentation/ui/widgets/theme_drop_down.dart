import 'package:flutter/material.dart';
import 'package:news_app/core/state/theme_provider.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:provider/provider.dart';

class ThemeDropDown extends StatelessWidget {
  const ThemeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select<ThemeProvider, ThemeMode>(
      (provider) => provider.themeMode,
    );
    final themeProvider = context.read<ThemeProvider>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(color: AppColors.light),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<ThemeMode>(
          dropdownColor: AppColors.dark.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(AppSpacing.md),
          elevation: 2,
          value: themeMode,
          icon: Icon(Icons.expand_more, color: AppColors.light),
          items: [
            DropdownMenuItem(
              value: ThemeMode.light,
              child: Row(
                children: [
                  Icon(Icons.sunny, size: 20, color: AppColors.light),
                  SizedBox(width: AppSpacing.sm),
                  Text("Light", style: TextStyle(color: AppColors.light)),
                ],
              ),
            ),

            DropdownMenuItem(
              value: ThemeMode.dark,
              child: Row(
                children: [
                  Icon(Icons.dark_mode, size: 20, color: AppColors.light),
                  SizedBox(width: AppSpacing.sm),
                  Text("Dark", style: TextStyle(color: AppColors.light)),
                ],
              ),
            ),
          ],
          onChanged: (mode) {
            if (mode != null) {
              themeProvider.changeTheme(mode);
            }
          },
        ),
      ),
    );
  }
}
