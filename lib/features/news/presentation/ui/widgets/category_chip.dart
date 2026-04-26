import 'package:flutter/material.dart';
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
                      style: context.text.titleLarge?.copyWith(
                        color: context.colors.primary,
                        fontSize: 32,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(AppSpacing.md),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: context.colors.primary.withValues(alpha: 0.5),
                      ),
                      child: isIndexEven
                          ? Row(
                              children: [
                                Text(
                                  "View All",
                                  style: context.text.titleLarge,
                                ),

                                Spacer(),

                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: context.colors.primary,
                                  foregroundColor: context.colors.onPrimary,
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: context.colors.primary,
                                  foregroundColor: context.colors.onPrimary,
                                  child: Icon(Icons.arrow_back_ios),
                                ),

                                SizedBox(width: AppSpacing.md),

                                Text(
                                  "View All",
                                  style: context.text.titleLarge,
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
