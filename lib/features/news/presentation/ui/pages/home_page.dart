import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/core/utils/spacing.dart';
import 'package:news_app/features/news/data/models/categories/category_model.dart';
import 'package:news_app/features/news/presentation/state/news_provider.dart';
import 'package:news_app/features/news/presentation/state/sources_provider.dart';
import 'package:news_app/features/news/presentation/ui/pages/news_page.dart';
import 'package:news_app/features/news/presentation/ui/widgets/category_chip.dart';
import 'package:news_app/features/news/presentation/ui/widgets/custom_scaffold.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'home';
  List<CategoryModel> categories = CategoryModel.categories;

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: context.l10n.home,
      onHomeClick: () {},
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              context.l10n.homeTitle1,
              textAlign: TextAlign.start,
              style: context.text.titleLarge,
            ),

            SizedBox(height: 2),

            Text(
              context.l10n.homeTitle2,
              textAlign: TextAlign.start,
              style: context.text.titleLarge,
            ),

            SizedBox(height: AppSpacing.md),

            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          settings: RouteSettings(arguments: category),
                          builder: (_) => MultiProvider(
                            providers: [
                              ChangeNotifierProvider(
                                create: (_) => SourcesProvider(),
                              ),
                              ChangeNotifierProvider(
                                create: (_) => NewsProvider(),
                              ),
                            ],
                            child: NewsPage(),
                          ),
                        ),
                      );
                    },
                    child: CategoryChip(category: category, index: index),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: AppSpacing.md);
                },
                itemCount: categories.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
