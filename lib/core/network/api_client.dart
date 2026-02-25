import 'package:dio/dio.dart';
import 'package:news_app/core/network/api_constants.dart';

class ApiClient {
  late final Dio dio;

  ApiClient() {
    dio = Dio(
        BaseOptions(
          baseUrl: EndPoints.baseUrl,
          connectTimeout: Duration(seconds: ApiConstants.connectTimeout),
          receiveTimeout: Duration(seconds: ApiConstants.receiveTimeout),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
        )
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.queryParameters['apiKey'] = EndPoints.apiKey;
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
        )
    );
  }

}