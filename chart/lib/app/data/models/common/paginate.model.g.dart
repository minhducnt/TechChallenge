// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginate<T> _$PaginateFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginate<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      hasMore: json['has_more'] as bool?,
      quotaMax: (json['quota_max'] as num?)?.toInt(),
      quotaRemaining: (json['quota_remaining'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginateToJson<T>(
  Paginate<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items?.map(toJsonT).toList(),
      'has_more': instance.hasMore,
      'quota_max': instance.quotaMax,
      'quota_remaining': instance.quotaRemaining,
    };
