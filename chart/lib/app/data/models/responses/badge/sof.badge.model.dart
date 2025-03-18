import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sof_tracker/app/global/constants/secure/stores.dart';

part 'sof.badge.model.freezed.dart';
part 'sof.badge.model.g.dart';

@freezed
abstract class SofBadgeModel with _$SofBadgeModel {
  @HiveType(
    typeId: AppStoreKeys.sofBadgeAdapterId,
    adapterName: 'SofBadgeAdapter',
  )
  factory SofBadgeModel({
    @HiveField(0, defaultValue: 0) int? bronze,
    @HiveField(1, defaultValue: 0) int? silver,
    @HiveField(2, defaultValue: 0) int? gold,
  }) = _SofBadgeModel;

  factory SofBadgeModel.fromJson(Map<String, dynamic> json) => _$SofBadgeModelFromJson(json);
}
