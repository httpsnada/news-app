import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/sources/Source.dart';
import 'package:news_app/features/news/presentation/state/news_provider.dart';
import 'package:news_app/features/news/presentation/ui/widgets/article_card.dart';
import 'package:provider/provider.dart';

class ArticleList extends StatefulWidget {
  final Source source;

  ArticleList({super.key, required this.source});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList>
    with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  // not to reload and recall the api for each tab, and saving them in memory instead

  @override
  void initState() {
    super.initState();
    // final repo = ServiceLocator.newsRepository;
    // articleFuture = repo.getArticlesBySource(source: widget.source.id ?? "");
    Future.microtask(() {
      context.read<NewsProvider>().fetchArticles(widget.source.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<NewsProvider>(
      builder: (context, provider, _) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (provider.error != null) {
          return const Center(child: Text("Failed to load articles"));
        }

        final results = provider.articleModel;
        final articles = results!.articles ?? [];

        if (articles.isEmpty) {
          return Center(child: Text("No articles available"));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await context.read<NewsProvider>().fetchArticles(widget.source.id ??
                "");
          },
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return ArticleCard(article: article);
            },
          ),
        );
      },
    );
  }
}
