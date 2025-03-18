import 'package:json_annotation/json_annotation.dart';

part 'paginate.model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginate<T> {
  List<T>? items;

  @JsonKey(name: 'has_more')
  bool? hasMore;

  @JsonKey(name: 'quota_max')
  int? quotaMax;

  @JsonKey(name: 'quota_remaining')
  int? quotaRemaining;

  Paginate({
    this.items,
    this.hasMore,
    this.quotaMax,
    this.quotaRemaining,
  });

  factory Paginate.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginateFromJson<T>(json, fromJsonT);
  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$PaginateToJson(this, toJsonT);
}
