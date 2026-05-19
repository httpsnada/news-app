import 'package:flutter/material.dart';
import 'package:news_app/core/utils/extensions.dart';
import 'package:news_app/features/news/presentation/ui/widgets/search_field.dart';

import '../../../../../core/utils/spacing.dart';

class SearchPage extends StatefulWidget {
  static const String routeName = 'search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined),
                  color: context.colors.onPrimary,
                ),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.clear, color: context.colors.onPrimary),
                ),
                controller: _controller,
                onFieldSubmitted: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
