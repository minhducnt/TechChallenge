// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof.paginate.request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SofPaginateRequest _$SofPaginateRequestFromJson(Map<String, dynamic> json) =>
    SofPaginateRequest(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
      site: json['site'] as String? ?? 'stackoverflow',
    );

Map<String, dynamic> _$SofPaginateRequestToJson(SofPaginateRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'site': instance.site,
    };
