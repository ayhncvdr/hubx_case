import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:hubx_case/shared/utils/api_endpoints.dart';

class NetworkManager {
  NetworkManager({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  Uri _buildUri(String path) => Uri.parse('${ApiEndpoints.baseUrl}$path');

  Future<Map<String, dynamic>> getJson(
    String path, {
    Map<String, String>? headers,
  }) async {
    final response = await _httpClient.get(_buildUri(path), headers: headers);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return json.decode(response.body) as Map<String, dynamic>;
    }
    throw http.ClientException(
      'Request failed: ${response.statusCode}',
      _buildUri(path),
    );
  }
}
