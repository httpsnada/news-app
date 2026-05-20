import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/features/news/presentation/ui/widgets/search_field.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/spacing.dart';
import '../../state/search_provider.dart';
import '../widgets/article_card.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String keyword = '';
  late final TextEditingController _textController;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _scrollController = ScrollController()
      ..addListener(_onScroll);
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;

    if (position.pixels >= position.maxScrollExtent - 300) {
      context.read<SearchProvider>().searchForArticles(keyword, loadMore: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.lg,
              horizontal: AppSpacing.md,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SearchField(
                  hintText: context.l10n.search,
                  hintStyle: context.text.bodyMedium?.copyWith(
                    color: context.colors.secondary,
                  ),
                  style: context.text.bodyMedium,
                  prefixIcon: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined),
                    color: context.colors.onPrimary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _textController.clear();
                      context.read<SearchProvider>().clearSearch();
                    },
                    icon: Icon(Icons.clear, color: context.colors.onPrimary),
                  ),
                  controller: _textController,
                  onFieldSubmitted: (value) {
                    keyword = value;
                    context.read<SearchProvider>().searchForArticles(keyword);
                  },
                ),

                SizedBox(height: AppSpacing.md),

                Expanded(
                  child: Consumer<SearchProvider>(
                    builder: (context, provider, _) {
                      if (provider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (provider.error != null) {
                        return Center(child: Text(
                            context.l10n.articleListError));
                      }

                      final articles = provider.articles;

                      if (articles.isEmpty) {
                        return Center(child: Text(
                            context.l10n.articleListEmpty));
                      }

                      return ListView.builder(
                        controller: _scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount:
                        provider.articles.length +
                            (provider.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index == provider.articles.length) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }

                          return ArticleCard(article: provider.articles[index]);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
