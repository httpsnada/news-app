import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/presentation/state/news_provider.dart';
import 'package:news_app/features/news/presentation/state/sources_provider.dart';
import 'package:news_app/features/news/presentation/ui/pages/home_page.dart';
import 'package:news_app/features/news/presentation/ui/widgets/article_list.dart';
import 'package:news_app/features/news/presentation/ui/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

import '../../../../../core/state/language_provider.dart';
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
  String? previousLanguage;

  // We use didChangeDependencies() bc we are receiving an inherited context argument
  // didChangeDependencies() runs after Flutter has connected the widget to inherited widgets
  // route-dependent inherited context can still be unavailable during initState()

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    category ??= ModalRoute.of(context)?.settings.arguments as CategoryModel;

    final currentLanguage = context
        .watch<LanguageProvider>()
        .language
        .languageCode;

    if (previousLanguage != currentLanguage) {
      previousLanguage = currentLanguage;

      Future.microtask(() {
        context.read<SourcesProvider>().fetchTopHeadlines(
          category!.id,
          currentLanguage,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SourcesProvider>();
    final sources = provider.sourceModel?.sources ?? [];

    return DefaultTabController(
      length: sources.isEmpty ? 1 : sources.length,
      child: CustomScaffold(
        title: category!.localizedName(context),
        onHomeClick: onHomeClick,
        bottom: provider.isLoading || sources.isEmpty
            ? null
            : TabBar(
                isScrollable: true,
                dividerColor: context.colors.onPrimary,
                indicatorColor: context.colors.onPrimary,
                labelColor: context.colors.onPrimary,
                unselectedLabelColor: context.colors.secondary,
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
              Text(context.l10n.sourcesError, style: context.text.bodyMedium),
              SizedBox(height: AppSpacing.md),
              ElevatedButton(
                onPressed: () async {
                  await context.read<SourcesProvider>().fetchTopHeadlines(
                    category!.id,
                    context.read<LanguageProvider>().language.languageCode,
                  );
                },
                child: Text(context.l10n.retry),
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
        child: Center(child: Text(context.l10n.sourcesEmpty)),
      );
    }

    return Padding(
      padding: EdgeInsets.all(AppSpacing.md),
      child: TabBarView(
        children: sources.map((source) {
          return ChangeNotifierProvider(
            create: (_) => NewsProvider(),
            child: ArticleList(key: ValueKey(source.id), source: source),
          );
        }).toList(),
      ),
    );
  }
}
