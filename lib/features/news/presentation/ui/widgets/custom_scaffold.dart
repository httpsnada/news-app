import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/presentation/ui/pages/search_page.dart';
import 'package:news_app/features/news/presentation/ui/widgets/language_drop_down.dart';
import 'package:news_app/features/news/presentation/ui/widgets/theme_drop_down.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final PreferredSizeWidget? bottom;
  final VoidCallback onHomeClick;

  CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.bottom,
    required this.onHomeClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        bottom: bottom,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.routeName);
            },
            icon: Icon(Icons.search, size: 24),
          ),
        ],
      ),

      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: AppColors.dark,
        child: Column(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                decoration: BoxDecoration(color: AppColors.light),
                child: Center(
                  child: Text(
                    AppStrings.newsApp,
                    style: context.text.titleLarge?.copyWith(
                      color: AppColors.dark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            ListTile(
              iconColor: AppColors.light,
              textColor: AppColors.light,
              onTap: () {
                Navigator.pop(context);
                onHomeClick();
              },
              leading: Icon(Icons.home),
              title: Text(context.l10n.back),
            ),

            Divider(),

            SizedBox(height: AppSpacing.md,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.themeKey,
                    style: TextStyle(color: AppColors.light),),
                  SizedBox(height: AppSpacing.md,),
                  ThemeDropDown(),
                ],
              ),
            ),

            SizedBox(height: AppSpacing.md,),

            Divider(),

            SizedBox(height: AppSpacing.md,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.l10n.languageKey,
                    style: TextStyle(color: AppColors.light),),
                  SizedBox(height: AppSpacing.md,),
                  LanguageDropDown(),
                ],
              ),
            ),
          ],
        ),
      ),

      body: body,
    );
  }
}
