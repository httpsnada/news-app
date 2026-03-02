import 'package:news_app/core/network/api_client.dart';
import 'package:news_app/core/network/api_services.dart';
import 'package:news_app/features/news/data/repositories/news_repository.dart';

class ServiceLocator {
  static final ApiClient _apiClient = ApiClient();
  static final ApiService _apiService = ApiService(dio: _apiClient.dio);
  static final NewsRepository newsRepository = NewsRepository(
    apiService: _apiService,
  );
}

// single source of truth  ---> All dependencies live in one place
// easier to modify
