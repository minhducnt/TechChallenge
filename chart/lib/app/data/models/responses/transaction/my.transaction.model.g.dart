// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my.transaction.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyTransactionImpl _$$MyTransactionImplFromJson(Map<String, dynamic> json) =>
    _$MyTransactionImpl(
      day: json['day'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MyTransactionImplToJson(_$MyTransactionImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'amount': instance.amount,
    };
