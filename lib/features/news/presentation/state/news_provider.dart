import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/articles/Articles_model.dart';

import '../../../../core/di/service_locator.dart';

class NewsProvider extends ChangeNotifier {
  ArticlesModel? articleModel;

  //  List<Articles> articles = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchArticles(String source) async {
    isLoading = true;
    notifyListeners();

    try {
      final repo = ServiceLocator.newsRepository;

      final result = await repo.getArticlesBySource(source: source);
      articleModel = result;
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
