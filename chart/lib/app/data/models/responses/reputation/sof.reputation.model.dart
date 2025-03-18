import 'package:freezed_annotation/freezed_annotation.dart';

part 'sof.reputation.model.freezed.dart';
part 'sof.reputation.model.g.dart';

@freezed
class SofReputationModel with _$SofReputationModel {
  const factory SofReputationModel({
    @JsonKey(name: 'reputation_history_type') String? reputationHistoryType,
    @JsonKey(name: 'reputation_change') int? reputationChange,
    @JsonKey(name: 'post_id') int? postId,
    @JsonKey(name: 'creation_date') int? creationDate,
    @JsonKey(name: 'user_id') int? userId,
  }) = _SofReputationModel;

  factory SofReputationModel.fromJson(Map<String, dynamic> json) => _$SofReputationModelFromJson(json);
}
