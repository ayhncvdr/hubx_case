import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hubx_case/shared/utils/api_endpoints.dart';

class NetworkManager {
  NetworkManager._({
    Dio? dio,
    Duration connectTimeout = const Duration(seconds: 10),
    Duration receiveTimeout = const Duration(seconds: 20),
    Duration sendTimeout = const Duration(seconds: 20),
    bool enableLogging = true,
  }) : _dio = dio ?? _createDio(connectTimeout, receiveTimeout, sendTimeout, enableLogging);

  static NetworkManager? _instance;

  /// Singleton instance of NetworkManager
  factory NetworkManager.instance() {
    _instance ??= NetworkManager._();
    return _instance!;
  }

  final Dio _dio;

  static Dio _createDio(
    Duration connectTimeout,
    Duration receiveTimeout,
    Duration sendTimeout,
    bool enableLogging,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
    );

    if (enableLogging) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );
    }

    return dio;
  }

  Future<dynamic> getJson(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Duration? timeout,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<dynamic>(
      path,
      queryParameters: query,
      options: Options(
        headers: headers,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        responseType: ResponseType.json,
      ),
      cancelToken: cancelToken,
    );

    if (response.data is String) {
      return json.decode(response.data as String);
    }

    return response.data;
  }

  Future<Map<String, dynamic>> postJson(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    Object? data,
    Duration? timeout,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<dynamic>(
      path,
      queryParameters: query,
      data: data,
      options: Options(
        headers: headers,
        sendTimeout: timeout,
        receiveTimeout: timeout,
        responseType: ResponseType.json,
      ),
      cancelToken: cancelToken,
    );

    if (response.data is Map<String, dynamic>) {
      return response.data as Map<String, dynamic>;
    }

    if (response.data is String) {
      try {
        final decoded = json.decode(response.data as String) as Map<String, dynamic>;
        return decoded;
      } catch (e) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          error: 'Failed to parse JSON string: $e',
          type: DioExceptionType.badResponse,
        );
      }
    }

    throw DioException(
      requestOptions: response.requestOptions,
      response: response,
      error: 'Expected JSON object or string, got ${response.data.runtimeType}',
      type: DioExceptionType.badResponse,
    );
  }

  Future<void> download(
    String path, {
    required String savePath,
    Map<String, dynamic>? query,
    Map<String, dynamic>? headers,
    ProgressCallback? onReceiveProgress,
    CancelToken? cancelToken,
    Duration? timeout,
  }) async {
    await _dio.download(
      path,
      savePath,
      queryParameters: query,
      options: Options(
        headers: headers,
        receiveTimeout: timeout,
        sendTimeout: timeout,
      ),
      onReceiveProgress: onReceiveProgress,
      cancelToken: cancelToken,
    );
  }
}
