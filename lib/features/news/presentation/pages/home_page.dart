import 'package:flutter/material.dart';
import 'package:news_app/core/constants/app_strings.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/categories/category_model.dart';
import 'package:news_app/features/news/presentation/pages/news_page.dart';
import 'package:news_app/features/news/presentation/widgets/category_chip.dart';
import 'package:news_app/features/news/presentation/widgets/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  List<CategoryModel> categories = CategoryModel.categories;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return CustomScaffold(
      title: "Home",
      onHomeClick: () {},
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.homeTitle1,
              textAlign: TextAlign.start,
              style: theme.textTheme.titleLarge,
            ),

            SizedBox(height: 2),

            Text(
              AppStrings.homeTitle2,
              textAlign: TextAlign.start,
              style: theme.textTheme.titleLarge,
            ),

            SizedBox(height: AppSpacing.md),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        NewsPage.routeName,
                        arguments: category,
                      );
                    },
                    child: CategoryChip(category: category, index: index),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppSpacing.md);
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

