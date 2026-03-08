import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/theme/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback onHomeClick;

  CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.onHomeClick,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              // TODO: navigate to search
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
                    style: theme.textTheme.titleLarge?.copyWith(
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
              title: Text(AppStrings.back),
            ),

            Divider(),

            ListTile(
              iconColor: AppColors.light,
              textColor: AppColors.light,
              leading: Icon(Icons.sunny),
              title: Text("Mode"),
              // TODO: change theme
            ),

            Divider(),
          ],
        ),
      ),

      body: body,
    );
  }
}
