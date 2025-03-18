import 'package:dio/dio.dart';

import 'package:sof_tracker/app/data/apis/exception_handler.dart';
import 'package:sof_tracker/app/data/di.dart';

/// Custom Interceptor
class RestInterceptor extends Interceptor {
  //* Handle API error
  Future<void> _handleApiError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorTitle = err.response?.data['title'];
    if (errorTitle == 'One or more validation errors occurred.') {
      return handler.reject(InvalidJsonFormatException(requestOptions: err.requestOptions));
    }

    final exception = ApiException(
      errorMessage: err.error.toString(),
      requestOptions: err.requestOptions,
      response: err.response,
      error: err.error,
      type: err.type,
    );

    final genericException = InternalServerException(requestOptions: err.requestOptions);

    return handler.reject(err.response != null ? exception : genericException);
  }

  //* Interceptors
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Cache buster
    final cacheBuster = DateTime.now().millisecondsSinceEpoch.toString();
    final originalUri = Uri.parse(options.path);

    // Simplify the update of query parameters and path normalization
    final updatedUri = originalUri.replace(
      path: originalUri.path.replaceAll('///', '/'),
      queryParameters: Map<String, String>.from(originalUri.queryParameters)
        ..remove('cacheBuster')
        ..['cacheBuster'] = cacheBuster,
    );

    options.path = updatedUri.toString();

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    final statusCode = response?.statusCode;

    if (statusCode != null) {
      switch (statusCode) {
        case 400:
        case 404:
          return _handleApiError(err, handler);
        case 403:
          return handler.reject(ForbiddenException(requestOptions: err.requestOptions));
        case 401:
          return handler.reject(UnauthenticatedException(requestOptions: err.requestOptions));
        default:
          if (statusCode >= 500 && statusCode < 600) {
            return handler.reject(InternalServerException(requestOptions: err.requestOptions));
          }
          break;
      }
    }

    if (response == null && !await $network.hasInternetAccess) {
      return handler.reject(BadNetworkException(requestOptions: err.requestOptions));
    }

    super.onError(err, handler);
  }
}
