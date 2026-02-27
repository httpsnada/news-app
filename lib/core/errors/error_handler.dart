import 'package:dio/dio.dart';
import 'package:news_app/core/errors/api_errors.dart';

class ApiExceptions implements Exception {
  final String message;

  ApiExceptions({required this.message});

  @override
  String toString() => message;
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ApiExceptions(message: 'Connection Timeout');

    case DioExceptionType.sendTimeout:
      throw ApiExceptions(message: 'Send Timeout');

    case DioExceptionType.receiveTimeout:
      throw ApiExceptions(message: "Receive timeout");

    case DioExceptionType.badCertificate:
      throw ApiExceptions(message: "Bad Certificate");

    case DioExceptionType.cancel:
      throw ApiExceptions(message: "Request was cancelled");

    case DioExceptionType.connectionError:
      throw ApiExceptions(message: "No internet connection");

    case DioExceptionType.unknown:
      throw ApiExceptions(message: "Unexpected error occurred");

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;
      // if data is null
      String message = 'Server Error';

      // if data isn't null but the message is
      if (data is Map<String, dynamic>) {
        message = ApiErrors.fromJson(data).message;
      }

      switch (statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
        case 409:
        case 422:
        case 504:
          throw ApiExceptions(message: message);
        default:
          throw ApiExceptions(message: message);
      }
  }
}
