import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const connectTimeout = 20 * 1000;
  static const receiveTimeout = 20 * 1000;
}

class EndPoints {
  static String baseUrl = dotenv.env['BASE_URL']!;
  static String newsEndpoint = dotenv.env['NEWS_ENDPOINT']!;
  static String sourcesEndpoint = dotenv.env['SOURCES_ENDPOINT']!;
  static String apiKey = dotenv.env['API_KEY']!;
}
