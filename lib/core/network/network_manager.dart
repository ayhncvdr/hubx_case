import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hubx_case/shared/utils/api_endpoints.dart';

class NetworkManager {
  NetworkManager({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Uri _buildUri(String path, {Map<String, String>? query}) {
    final base = Uri.parse(ApiEndpoints.baseUrl);
    return Uri(
      scheme: base.scheme,
      userInfo: base.userInfo,
      host: base.host,
      port: base.hasPort ? base.port : null,
      path: base.path.endsWith('/') ? '${base.path}$path'.replaceAll('//', '/') : '${base.path}/$path',
      queryParameters: query,
    );
  }

  Future<Map<String, dynamic>> getJson(
    String path, {
    Map<String, String>? query,
    Map<String, String>? headers,
    Duration timeout = const Duration(seconds: 15),
  }) async {
    final uri = _buildUri(path, query: query);
    final response = await _httpClient.get(uri, headers: headers).timeout(timeout);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      try {
        final decoded = json.decode(response.body);
        if (decoded is Map<String, dynamic>) {
          return decoded;
        }
        throw const FormatException('Expected JSON object');
      } on FormatException catch (e) {
        throw http.ClientException('Invalid JSON: ${e.message}', uri);
      }
    }
    throw http.ClientException(
      'Request failed: ${response.statusCode}',
      uri,
    );
  }
}
