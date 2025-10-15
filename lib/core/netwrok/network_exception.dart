import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  factory NetworkException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return NetworkException('Connection timeout');
      case DioExceptionType.sendTimeout:
        return NetworkException('Send timeout');
      case DioExceptionType.receiveTimeout:
        return NetworkException('Receive timeout');
      case DioExceptionType.badResponse:
        return NetworkException(
            'Invalid response: ${error.response?.statusCode}');
      case DioExceptionType.cancel:
        return NetworkException('Request was cancelled');
      default:
        return NetworkException('Unexpected error occurred');
    }
  }

  @override
  String toString() => message;
}
