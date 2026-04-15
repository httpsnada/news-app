import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/sources/Source_model.dart';

import '../../../../core/di/service_locator.dart';

class SourcesProvider extends ChangeNotifier {
  SourceModel? sourceModel;
  bool isLoading = false;
  String? error;

  Future<void> fetchTopHeadlines(String category) async {
    isLoading = true;
    notifyListeners();

    try {
      final repo = ServiceLocator.newsRepository;

      final result = await repo.getTopHeadlines(category: category);
      sourceModel = result;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
