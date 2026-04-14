import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';

import '../../../data/models/categories/category_model.dart';

class CategoryChip extends StatelessWidget {
  CategoryModel category;
  int index;

  bool get isIndexEven => index == 0 || index % 2 == 0;

  CategoryChip({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDarkMode = context.isDarkMode;

    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Stack(
        children: [
          Image.asset(
            isDarkMode ? category.imageDark : category.imageLight,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: isIndexEven
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: SizedBox(
              height: 200,
              width: 250,
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: isDarkMode ? AppColors.dark : AppColors.light,
                        fontSize: 32,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: isDarkMode
                            ? AppColors.dark.withValues(alpha: 0.5)
                            : AppColors.light.withValues(alpha: 0.5),
                      ),
                      child: isIndexEven
                          ? Row(
                              children: [
                                Text(
                                  "View All",
                                  style: theme.textTheme.titleLarge,
                                ),

                                Spacer(),

                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: isDarkMode
                                      ? AppColors.dark
                                      : AppColors.light,
                                  foregroundColor: isDarkMode
                                      ? AppColors.light
                                      : AppColors.dark,
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: isDarkMode
                                      ? AppColors.dark
                                      : AppColors.light,
                                  foregroundColor: isDarkMode
                                      ? AppColors.light
                                      : AppColors.dark,
                                  child: Icon(Icons.arrow_back_ios),
                                ),

                                SizedBox(width: AppSpacing.md),

                                Text(
                                  "View All",
                                  style: theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
