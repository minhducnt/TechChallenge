import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sof_tracker/app/data/models/responses/badge/sof.badge.model.dart';
import 'package:sof_tracker/app/global/constants/secure/stores.dart';

part 'sof.user.model.freezed.dart';
part 'sof.user.model.g.dart';

@freezed
class SofUserModel with _$SofUserModel {
  @HiveType(typeId: AppStoreKeys.sofUserAdapterId, adapterName: 'SofUserAdapter')
  const factory SofUserModel({
    @HiveField(0) @JsonKey(name: 'badge_counts') SofBadgeModel? badgeCounts,
    @HiveField(1) @JsonKey(name: 'account_id') int? accountId,
    @HiveField(2) @JsonKey(name: 'is_employee') bool? isEmployee,
    @HiveField(3) @JsonKey(name: 'last_modified_date') int? lastModifiedDate,
    @HiveField(4) @JsonKey(name: 'last_access_date') int? lastAccessDate,
    @HiveField(5) @JsonKey(name: 'reputation_change_year') int? reputationChangeYear,
    @HiveField(6) @JsonKey(name: 'reputation_change_quarter') int? reputationChangeQuarter,
    @HiveField(7) @JsonKey(name: 'reputation_change_month') int? reputationChangeMonth,
    @HiveField(8) @JsonKey(name: 'reputation_change_week') int? reputationChangeWeek,
    @HiveField(9) @JsonKey(name: 'reputation_change_day') int? reputationChangeDay,
    @HiveField(10) @JsonKey(name: 'reputation') int? reputation,
    @HiveField(11) @JsonKey(name: 'creation_date') int? creationDate,
    @HiveField(12) @JsonKey(name: 'user_type') String? userType,
    @HiveField(13) @JsonKey(name: 'user_id') int? userId,
    @HiveField(14) @JsonKey(name: 'accept_rate') int? acceptRate,
    @HiveField(15) @JsonKey(name: 'location') String? location,
    @HiveField(16) @JsonKey(name: 'website_url') String? websiteUrl,
    @HiveField(17) @JsonKey(name: 'link') String? link,
    @HiveField(18) @JsonKey(name: 'profile_image') String? profileImage,
    @HiveField(19) @JsonKey(name: 'display_name') String? displayName,
  }) = _SofUserModel;

  factory SofUserModel.fromJson(Map<String, dynamic> json) => _$SofUserModelFromJson(json);
}
