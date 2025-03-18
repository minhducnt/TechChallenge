import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:sof_tracker/app/data/apis/exception_handler.dart';
import 'package:sof_tracker/app/data/di.dart';
import 'package:sof_tracker/app/global/constants/enums/systems.dart';
import 'package:sof_tracker/app/global/utils/ui_utils.dart';

part 'alert.model.freezed.dart';

@freezed
class AlertModel with _$AlertModel {
  const factory AlertModel({
    required String message,
    required AlertType type,
    int? code,
    String? response,
  }) = _AlertModel;

  factory AlertModel.alert({
    required String message,
    required AlertType type,
    int? code,
    String? response,
  }) {
    if (type == AlertType.error) {
      $log.e(message);
    }

    return AlertModel(
      message: message,
      type: type,
      code: code,
      response: response,
    );
  }

  factory AlertModel.exception({
    required dynamic exception,
  }) {
    final exceptionToMessage = {
      BadNetworkException: localeLang.noInternetConnection,
      InternalServerException: localeLang.server_failure,
      InvalidJsonFormatException: localeLang.communication_error,
      UnauthenticatedException: localeLang.unauthenticated_error,
      ForbiddenException: localeLang.somethingWentWrongAgain,
      ApiException: exception.response != null ? exception.response.data['message'] : exception,
    };

    final message = exceptionToMessage[exception.runtimeType] ?? exception.toString();

    return AlertModel(
      message: message.toString(),
      response: exception.response != null ? exception.response.data['message'] : message.toString(),
      type: AlertType.exception,
    );
  }

  factory AlertModel.quiet() {
    return const AlertModel(
      message: '',
      type: AlertType.quiet,
    );
  }
}
