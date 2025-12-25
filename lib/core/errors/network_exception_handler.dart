import 'package:dio/dio.dart';
import 'package:hubx_case/core/errors/failure.dart';

class NetworkExceptionHandler {
  static Failure handleException(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          return const NetworkFailure('Connection timeout. Please check your internet connection.');
        case DioExceptionType.badResponse:
          final statusCode = error.response?.statusCode;
          final message = error.response?.statusMessage ?? 'Server error';
          return NetworkFailure('Server error ($statusCode): $message');
        case DioExceptionType.cancel:
          return const NetworkFailure('Request was cancelled');
        case DioExceptionType.connectionError:
          return const NetworkFailure('Failed to connect to server. Please check your internet connection.');
        case DioExceptionType.badCertificate:
          return const NetworkFailure('Certificate error. Please try again later.');
        case DioExceptionType.unknown:
          final message = error.message ?? 'Network error occurred';
          return NetworkFailure('Network error: $message');
      }
    }

    if (error is Failure) {
      return error;
    }

    return UnknownFailure(error.toString());
  }
}
