import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/articles/Articles_model.dart';
import 'package:news_app/features/news/data/models/sources/Source.dart';
import 'package:news_app/features/news/presentation/widgets/article_card.dart';

import '../../../../core/di/service_locator.dart';

class ArticleList extends StatefulWidget {
  final Source source;

  ArticleList({super.key, required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  late Future<ArticlesModel> articleFuture;

  @override
  void initState() {
    super.initState();
    final repo = ServiceLocator.newsRepository;
    articleFuture = repo.getArticlesBySource(source: widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: articleFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Failed to load articles"));
        }

        if (!snapshot.hasData) {
          return Center(child: Text("No articles found"));
        }

        final articles = snapshot.data!.articles;
        return ListView.builder(
          itemCount: articles!.length,
          itemBuilder: (context, index) {
            final article = articles[index];
            return ArticleCard(article: article);
          },
        );
      },
    );
  }
}
