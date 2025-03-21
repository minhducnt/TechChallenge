import 'package:freezed_annotation/freezed_annotation.dart';

part 'my.transaction.model.freezed.dart';
part 'my.transaction.model.g.dart';

@freezed
class MyTransaction with _$MyTransaction {
  const factory MyTransaction({String? day, double? amount}) = _MyTransaction;

  factory MyTransaction.fromJson(Map<String, dynamic> json) => _$MyTransactionFromJson(json);
}
