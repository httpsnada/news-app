import 'package:flutter/material.dart';
import 'package:news_app/features/news/data/models/articles/Articles.dart';
import 'package:news_app/features/news/data/models/articles/Articles_model.dart';

import '../../../../core/di/service_locator.dart';

class SearchProvider extends ChangeNotifier {
  ArticlesModel? articleModel;

  final List<Articles> _articles = [];

  List<Articles> get articles => _articles;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;

  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true;

  bool get hasMore => _hasMore;

  String? _error;

  String? get error => _error;

  String _currentKeyword = '';

  int _page = 1;
  static const int _pageSize = 20;

  Future<void> searchForArticles(
    String keyword, {
    bool loadMore = false,
  }) async {
    if (keyword.trim().isEmpty && !loadMore) {
      clearSearch();
      return;
    }

    if (_isLoading || _isLoadingMore) return;
    if (loadMore && !_hasMore) return;

    if (loadMore) {
      _isLoadingMore = true;
    } else {
      _currentKeyword = keyword;
      _isLoading = true;
      _page = 1;
      _articles.clear();
      _hasMore = true;
    }

    _error = null;
    notifyListeners();

    try {
      final repo = ServiceLocator.newsRepository;
      final result = await repo.searchForArticles(
        keyword: _currentKeyword,
        page: _page,
        pageSize: _pageSize,
      );
      articleModel = result;
      final newArticles = result.articles ?? [];

      _articles.addAll(newArticles);

      _hasMore = newArticles.length == _pageSize;

      if (_hasMore) {
        _page++;
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    _isLoadingMore = false;
    notifyListeners();
  }

  void clearSearch() {
    _articles.clear();
    _page = 1;
    _hasMore = true;
    _error = null;
    articleModel = null;
    _currentKeyword = '';
    notifyListeners();
  }
}
