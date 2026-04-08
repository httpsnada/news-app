import 'package:flutter/material.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/articles/Articles.dart';
import 'package:news_app/features/news/data/models/sources/Source_model.dart';
import 'package:news_app/features/news/presentation/pages/home_page.dart';
import 'package:news_app/features/news/presentation/widgets/article_card.dart';
import 'package:news_app/features/news/presentation/widgets/custom_scaffold.dart';

import '../../data/models/categories/category_model.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = 'news';

  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  late Future<SourceModel> sourcesFuture;
  CategoryModel? category;
  bool isInit = true;

  Articles article = Articles(
    author: "Jon Haworth",
    urlToImage:
        "https://i.pinimg.com/736x/c2/33/16/c23316afbc663d24d722d8588de2f926.jpg",
    title:
        "40-year-old man falls 200 feet to his death while canyoneering at national park",
    content: "content",
    description: "description",
    publishedAt: "15 minutes ago",
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
      final repo = ServiceLocator.newsRepository;
      sourcesFuture = repo.getTopHeadlines(category: category!.id);
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceModel>(
      future: sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CustomScaffold(
            title: category!.name,
            onHomeClick: onHomeClick,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        }

        if (snapshot.hasError) {
          return CustomScaffold(
            title: category!.name,
            onHomeClick: onHomeClick,

            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Failed to load sources",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(height: AppSpacing.md),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sourcesFuture = ServiceLocator.newsRepository
                              .getTopHeadlines(category: category!.id);
                        });
                      },
                      child: Text("Retry"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return CustomScaffold(
            title: category!.name,
            onHomeClick: onHomeClick,

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              child: Center(child: Text("No data")),
            ),
          );
        }

        final sources = snapshot.data!.sources;
        return DefaultTabController(
          length: sources!.length,
          child: CustomScaffold(
            title: category!.name,
            onHomeClick: onHomeClick,

            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              tabs: sources.map((s) => Tab(text: s.name)).toList(),
            ),

            body: Padding(
              padding: EdgeInsets.all(AppSpacing.md),
              child: TabBarView(children: [ArticleCard(article: article)]),
            ),
          ),
        );
      },
    );
  }

  void onHomeClick() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomePage.routeName,
      (route) => false,
    );
  }
}
