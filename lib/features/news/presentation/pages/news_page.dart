import 'package:flutter/material.dart';
import 'package:news_app/core/di/service_locator.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/sources/Source_model.dart';
import 'package:news_app/features/news/presentation/pages/home_page.dart';
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
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          // return Center(child: Text(snapshot.error.toString()));

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Failed to load sources"),
                SizedBox(height: AppSpacing.md),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      sourcesFuture =
                          ServiceLocator.newsRepository.getTopHeadlines(
                              category: category!.id);
                    });
                  },
                  child: Text("Retry"),
                )
              ],
            ),
          );
        }


        if (!snapshot.hasData) {
          return Center(child: Text("No data"));
        }

        final sources = snapshot.data!.sources;
        return DefaultTabController(
          length: sources!.length,
          child: CustomScaffold(
            title: category!.name,
            onHomeClick: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomePage.routeName,
                (route) => false,
              );
            },

            bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.symmetric(horizontal: AppSpacing.sm),
              tabs: sources.map((s) => Tab(text: s.name)).toList(),
            ),

            body: TabBarView(children: [Text(sources[0].name ?? "No data")]),
          ),
        );
      },
    );
  }
}
