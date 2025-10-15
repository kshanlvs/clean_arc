// lib/core/network/http_network_client.dart
import 'package:http/http.dart' as http;
import 'network_client.dart';
import 'network_exception.dart';

class HttpNetworkClient implements NetworkClient {
  final String baseUrl;
  HttpNetworkClient(this.baseUrl);

  @override
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final uri =
        Uri.parse('$baseUrl$path').replace(queryParameters: queryParameters);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw NetworkException('HTTP error: ${response.statusCode}');
    }
  }

  @override
  Future<dynamic> post(String path, {data}) async {
    final uri = Uri.parse('$baseUrl$path');
    final response = await http.post(uri, body: data);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw NetworkException('HTTP error: ${response.statusCode}');
    }
  }

  @override
  Future delete(String path, {data}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future put(String path, {data}) {
    // TODO: implement put
    throw UnimplementedError();
  }

  // put, delete... same pattern
}
