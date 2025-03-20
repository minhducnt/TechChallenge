import 'package:freezed_annotation/freezed_annotation.dart';

part 'money.deposit.model.freezed.dart';
part 'money.deposit.model.g.dart';

@freezed
class MoneyDeposit with _$MoneyDeposit {
  const factory MoneyDeposit({List<Data>? data}) = _MoneyDeposit;

  factory MoneyDeposit.fromJson(Map<String, dynamic> json) => _$MoneyDepositFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({int? day, double? amount}) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
