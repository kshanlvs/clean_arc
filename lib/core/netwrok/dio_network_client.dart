// lib/core/network/dio_network_client.dart
import 'package:dio/dio.dart';
import '../config/environment.dart';
import 'network_client.dart';
import 'network_exception.dart';

class DioNetworkClient implements NetworkClient {
  final Dio _dio;
  final AppConfig _config;

  DioNetworkClient(this._config, {Dio? dio})
      : _dio = dio ??
            Dio(BaseOptions(
              baseUrl: _config.baseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 15),
              headers: {'Content-Type': 'application/json'},
            )) {
    if (_config.environment != Environment.production) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }

  @override
  Future<dynamic> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  @override
  Future<dynamic> post(String path, {data}) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  @override
  Future<dynamic> put(String path, {data}) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }

  @override
  Future<dynamic> delete(String path, {data}) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
