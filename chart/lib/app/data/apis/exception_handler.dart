import 'package:data_channel/data_channel.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';

import 'package:sof_tracker/app/data/models/common/alert.model.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';

/// Repository function
typedef RepositoryFunction<T> = Future<DC<AlertModel, HttpResponse<T>>>
    Function();

/// Handle API error
Future<DC<AlertModel, HttpResponse<T>>> exceptionHandler<T>(
  RepositoryFunction<T> repositoryFunction,
) async {
  try {
    return await repositoryFunction();
  } catch (e) {
    AlertModel alert;

    alert = e is UnauthenticatedException || e is ApiException || e is Exception
        ? AlertModel.exception(exception: e)
        : AlertModel.alert(message: e.toString(), type: AlertType.error);

    return DC.error(alert);
  }
}

/// Custom exception
class BadNetworkException extends DioException {
  BadNetworkException({required super.requestOptions});
}

class InternalServerException extends DioException {
  InternalServerException({required super.requestOptions});
}

class UnauthenticatedException extends DioException {
  UnauthenticatedException({required super.requestOptions});
}

class FormatException extends DioException {
  FormatException({required super.requestOptions});
}

class InvalidJsonFormatException extends DioException {
  InvalidJsonFormatException({required super.requestOptions});
}

class ForbiddenException extends DioException {
  ForbiddenException({required super.requestOptions});
}

class ApiException extends DioException {
  ApiException({
    required this.errorMessage,
    required super.requestOptions,
    super.response,
    super.error,
    super.type,
  });

  final String errorMessage;
}
