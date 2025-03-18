import 'package:json_annotation/json_annotation.dart';

part 'sof.paginate.request.g.dart';

@JsonSerializable()
class SofPaginateRequest {
  final int? page;
  final int? pageSize;
  final String? site;

  SofPaginateRequest({
    this.page,
    this.pageSize,
    this.site = 'stackoverflow',
  });

  factory SofPaginateRequest.fromJson(Map<String, dynamic> json) => _$SofPaginateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SofPaginateRequestToJson(this);
}
