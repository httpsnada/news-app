import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/articles/Articles.dart';

class ArticleDialog extends StatelessWidget {
  final Articles article;

  const ArticleDialog({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: const Duration(milliseconds: 250),
      builder: (context, value, child) {
        return Transform.scale(scale: value, child: child);
      },
      child: Dialog(
        insetPadding: EdgeInsets.all(AppSpacing.md),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.md),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: AppSpacing.md),
          padding: EdgeInsets.all(AppSpacing.sm),
          decoration: BoxDecoration(
            color: context.colors.onPrimary,
            borderRadius: BorderRadius.circular(AppSpacing.md),
            border: Border.all(color: context.colors.onPrimary, width: 1),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(height: AppSpacing.sm),

              Text(
                article.title ?? "",
                style: context.text.titleLarge?.copyWith(
                  color: context.colors.primary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
              ),

              SizedBox(height: AppSpacing.sm),

              Text(
                "${article.description}" ?? "No description available.",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.text.bodyMedium,
              ),

              const SizedBox(height: AppSpacing.sm),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO
                    // Launch URL
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: context.colors.onPrimary,
                    backgroundColor: context.colors.primary,
                  ),
                  child: Text("Read Full Article"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
