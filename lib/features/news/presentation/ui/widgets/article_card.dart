import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/theme/app_colors.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/articles/Articles.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;

  ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(bottom: AppSpacing.md),
      padding: EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacing.md),
        border: Border.all(
          color: context.isDarkMode ? AppColors.light : AppColors.dark,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSpacing.sm),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 220,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: AppSpacing.sm),

          Text(
            article.title ?? "",
            style: theme.textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.start,
          ),

          SizedBox(height: AppSpacing.sm),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "By : ${article.author}",
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              SizedBox(width: AppSpacing.sm),

              Flexible(child: Text(
                  "${article.publishedAt}".formatNewsDate(),
                  style: theme.textTheme.bodySmall)),
            ],
          ),
        ],
      ),
    );
  }
}
