// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money.deposit.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoneyDepositImpl _$$MoneyDepositImplFromJson(Map<String, dynamic> json) =>
    _$MoneyDepositImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MoneyDepositImplToJson(_$MoneyDepositImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      day: (json['day'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'amount': instance.amount,
    };
