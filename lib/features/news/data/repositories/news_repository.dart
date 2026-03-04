import 'package:news_app/core/network/api_constants.dart';
import 'package:news_app/core/network/api_services.dart';
import 'package:news_app/features/news/data/models/sources/Source_model.dart';

import '../models/articles/Articles_model.dart';

class NewsRepository {
  final ApiService apiService;

  NewsRepository({required this.apiService});

  Future<ArticlesModel> getArticlesBySource({
    required String source,
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await apiService.get(
      endpoint: EndPoints.newsEndpoint,
      queryParameters: {'sources': source, 'page': page, 'pageSize': pageSize},
    );
    // final List<dynamic>? articles = response['articles'];
    // if (articles == null) {
    //   return [];
    // }
    // return articles.map((e) => Articles.fromJson(e)).toList();
    final articlesModel = ArticlesModel.fromJson(response);
    return articlesModel;
    //  return articlesModel.articles ?? [];
  }

  Future<ArticlesModel> searchForArticles({
    required String keyword,
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await apiService.get(
      endpoint: EndPoints.newsEndpoint,
      queryParameters: {'q': keyword, 'page': page, 'pageSize': pageSize},
    );
    final articlesModel = ArticlesModel.fromJson(response);
    return articlesModel;
  }

  Future<SourceModel> getTopHeadlines({
    required String category,
  }) async {
    final response = await apiService.get(
      endpoint: EndPoints.sourcesEndpoint,
      queryParameters: {'category': category},
    );

    final sourceModel = SourceModel.fromJson(response);
    return sourceModel;
  }
}

// we parse the whole response using the response model, to be able to access things like totalResults and the full article list
// we cant parse article.fromJson directly bc fromJson expect a map while the response is a list (dynamic), so we need to parse the full response