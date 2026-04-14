import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/articles/Articles_model.dart';
import 'package:news_app/features/news/data/models/sources/Source.dart';
import 'package:news_app/features/news/presentation/ui/widgets/article_card.dart';

import '../../../../../core/di/service_locator.dart';

class ArticleList extends StatefulWidget {
  final Source source;

  ArticleList({super.key, required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList>
    with AutomaticKeepAliveClientMixin {
  late Future<ArticlesModel> articleFuture;

  @override
  bool get wantKeepAlive => true;

  // not to reload and recall the api for each tab, and saving them in memory instead

  @override
  void initState() {
    super.initState();
    final repo = ServiceLocator.newsRepository;
    articleFuture = repo.getArticlesBySource(source: widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          return Center(child: Text("No articles available"));
        }

        final articles = snapshot.data!.articles;
        if (articles!.isEmpty) {
          return Center(child: Text("No articles available"));
        }

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
