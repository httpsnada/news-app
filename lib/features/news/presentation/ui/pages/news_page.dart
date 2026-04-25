import 'package:flutter/material.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/presentation/state/sources_provider.dart';
import 'package:news_app/features/news/presentation/ui/pages/home_page.dart';
import 'package:news_app/features/news/presentation/ui/widgets/article_list.dart';
import 'package:news_app/features/news/presentation/ui/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import '../../../data/models/categories/category_model.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = 'news';

  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  CategoryModel? category;
  bool isInit = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      category = ModalRoute.of(context)?.settings.arguments as CategoryModel;
      Future.microtask(() {
        context.read<SourcesProvider>().fetchTopHeadlines(category!.id);
      });
      isInit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SourcesProvider>();
    final sources = provider.sourceModel?.sources ?? [];

    return DefaultTabController(
      length: sources.isEmpty ? 1 : sources.length,
      child: CustomScaffold(
        title: category!.name,
        onHomeClick: onHomeClick,
        bottom: provider.isLoading || sources.isEmpty
            ? null
            : TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                tabs: sources.map((s) => Tab(text: s.name)).toList(),
              ),
        body: _buildBody(provider, sources),
      ),
    );
  }

  void onHomeClick() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomePage.routeName,
      (route) => false,
    );
  }

  Widget _buildBody(SourcesProvider provider, List sources) {
    if (provider.isLoading) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (provider.error != null) {
      return Padding(
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
                  context.read<SourcesProvider>().fetchTopHeadlines(
                      category!.id);
                  // setState(() {
                    // sourcesFuture = ServiceLocator.newsRepository
                    //     .getTopHeadlines(category: category!.id);
                  // });
                },
                child: Text("Retry"),
              ),
            ],
          ),
        ),
      );
    }

    final sources = provider.sourceModel?.sources ?? [];
    if (sources.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: Center(child: Text("No data")),
      );
    }

    return Padding(
      padding: EdgeInsets.all(AppSpacing.md),
      child: TabBarView(
        children: sources.map((source) {
          return ArticleList(
              key: ValueKey(source.id),
              source: source);
        }).toList(),
      ),
    );
  }
}
