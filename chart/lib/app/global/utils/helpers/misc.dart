import 'package:intl/intl.dart';
import 'package:get/get.dart';

bool isNullOrEmpty(dynamic input) {
  var localInput = input;
  if (localInput is String) localInput = localInput.trim();
  return GetUtils.isNullOrBlank(localInput) ?? true;
}

String isStringEmpty(String? input, {String? errorMessage}) {
  if (isNullOrEmpty(input)) return errorMessage ?? '';
  return input ?? '';
}

String getUTCDateTime(int timestamp) {
  final date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  final utcDate = date.toUtc();
  return DateFormat.yMMMMd().format(utcDate);
}