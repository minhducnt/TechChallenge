// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sof.user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SofUserModel _$SofUserModelFromJson(Map<String, dynamic> json) {
  return _SofUserModel.fromJson(json);
}

/// @nodoc
mixin _$SofUserModel {
  @HiveField(0)
  @JsonKey(name: 'badge_counts')
  SofBadgeModel? get badgeCounts => throw _privateConstructorUsedError;
  @HiveField(1)
  @JsonKey(name: 'account_id')
  int? get accountId => throw _privateConstructorUsedError;
  @HiveField(2)
  @JsonKey(name: 'is_employee')
  bool? get isEmployee => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(name: 'last_modified_date')
  int? get lastModifiedDate => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(name: 'last_access_date')
  int? get lastAccessDate => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'reputation_change_year')
  int? get reputationChangeYear => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'reputation_change_quarter')
  int? get reputationChangeQuarter => throw _privateConstructorUsedError;
  @HiveField(7)
  @JsonKey(name: 'reputation_change_month')
  int? get reputationChangeMonth => throw _privateConstructorUsedError;
  @HiveField(8)
  @JsonKey(name: 'reputation_change_week')
  int? get reputationChangeWeek => throw _privateConstructorUsedError;
  @HiveField(9)
  @JsonKey(name: 'reputation_change_day')
  int? get reputationChangeDay => throw _privateConstructorUsedError;
  @HiveField(10)
  @JsonKey(name: 'reputation')
  int? get reputation => throw _privateConstructorUsedError;
  @HiveField(11)
  @JsonKey(name: 'creation_date')
  int? get creationDate => throw _privateConstructorUsedError;
  @HiveField(12)
  @JsonKey(name: 'user_type')
  String? get userType => throw _privateConstructorUsedError;
  @HiveField(13)
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @HiveField(14)
  @JsonKey(name: 'accept_rate')
  int? get acceptRate => throw _privateConstructorUsedError;
  @HiveField(15)
  @JsonKey(name: 'location')
  String? get location => throw _privateConstructorUsedError;
  @HiveField(16)
  @JsonKey(name: 'website_url')
  String? get websiteUrl => throw _privateConstructorUsedError;
  @HiveField(17)
  @JsonKey(name: 'link')
  String? get link => throw _privateConstructorUsedError;
  @HiveField(18)
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @HiveField(19)
  @JsonKey(name: 'display_name')
  String? get displayName => throw _privateConstructorUsedError;

  /// Serializes this SofUserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SofUserModelCopyWith<SofUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SofUserModelCopyWith<$Res> {
  factory $SofUserModelCopyWith(
          SofUserModel value, $Res Function(SofUserModel) then) =
      _$SofUserModelCopyWithImpl<$Res, SofUserModel>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'badge_counts') SofBadgeModel? badgeCounts,
      @HiveField(1) @JsonKey(name: 'account_id') int? accountId,
      @HiveField(2) @JsonKey(name: 'is_employee') bool? isEmployee,
      @HiveField(3) @JsonKey(name: 'last_modified_date') int? lastModifiedDate,
      @HiveField(4) @JsonKey(name: 'last_access_date') int? lastAccessDate,
      @HiveField(5)
      @JsonKey(name: 'reputation_change_year')
      int? reputationChangeYear,
      @HiveField(6)
      @JsonKey(name: 'reputation_change_quarter')
      int? reputationChangeQuarter,
      @HiveField(7)
      @JsonKey(name: 'reputation_change_month')
      int? reputationChangeMonth,
      @HiveField(8)
      @JsonKey(name: 'reputation_change_week')
      int? reputationChangeWeek,
      @HiveField(9)
      @JsonKey(name: 'reputation_change_day')
      int? reputationChangeDay,
      @HiveField(10) @JsonKey(name: 'reputation') int? reputation,
      @HiveField(11) @JsonKey(name: 'creation_date') int? creationDate,
      @HiveField(12) @JsonKey(name: 'user_type') String? userType,
      @HiveField(13) @JsonKey(name: 'user_id') int? userId,
      @HiveField(14) @JsonKey(name: 'accept_rate') int? acceptRate,
      @HiveField(15) @JsonKey(name: 'location') String? location,
      @HiveField(16) @JsonKey(name: 'website_url') String? websiteUrl,
      @HiveField(17) @JsonKey(name: 'link') String? link,
      @HiveField(18) @JsonKey(name: 'profile_image') String? profileImage,
      @HiveField(19) @JsonKey(name: 'display_name') String? displayName});

  $SofBadgeModelCopyWith<$Res>? get badgeCounts;
}

/// @nodoc
class _$SofUserModelCopyWithImpl<$Res, $Val extends SofUserModel>
    implements $SofUserModelCopyWith<$Res> {
  _$SofUserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeCounts = freezed,
    Object? accountId = freezed,
    Object? isEmployee = freezed,
    Object? lastModifiedDate = freezed,
    Object? lastAccessDate = freezed,
    Object? reputationChangeYear = freezed,
    Object? reputationChangeQuarter = freezed,
    Object? reputationChangeMonth = freezed,
    Object? reputationChangeWeek = freezed,
    Object? reputationChangeDay = freezed,
    Object? reputation = freezed,
    Object? creationDate = freezed,
    Object? userType = freezed,
    Object? userId = freezed,
    Object? acceptRate = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
    Object? link = freezed,
    Object? profileImage = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      badgeCounts: freezed == badgeCounts
          ? _value.badgeCounts
          : badgeCounts // ignore: cast_nullable_to_non_nullable
              as SofBadgeModel?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmployee: freezed == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAccessDate: freezed == lastAccessDate
          ? _value.lastAccessDate
          : lastAccessDate // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeYear: freezed == reputationChangeYear
          ? _value.reputationChangeYear
          : reputationChangeYear // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeQuarter: freezed == reputationChangeQuarter
          ? _value.reputationChangeQuarter
          : reputationChangeQuarter // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeMonth: freezed == reputationChangeMonth
          ? _value.reputationChangeMonth
          : reputationChangeMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeWeek: freezed == reputationChangeWeek
          ? _value.reputationChangeWeek
          : reputationChangeWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeDay: freezed == reputationChangeDay
          ? _value.reputationChangeDay
          : reputationChangeDay // ignore: cast_nullable_to_non_nullable
              as int?,
      reputation: freezed == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptRate: freezed == acceptRate
          ? _value.acceptRate
          : acceptRate // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SofBadgeModelCopyWith<$Res>? get badgeCounts {
    if (_value.badgeCounts == null) {
      return null;
    }

    return $SofBadgeModelCopyWith<$Res>(_value.badgeCounts!, (value) {
      return _then(_value.copyWith(badgeCounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SofUserModelImplCopyWith<$Res>
    implements $SofUserModelCopyWith<$Res> {
  factory _$$SofUserModelImplCopyWith(
          _$SofUserModelImpl value, $Res Function(_$SofUserModelImpl) then) =
      __$$SofUserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'badge_counts') SofBadgeModel? badgeCounts,
      @HiveField(1) @JsonKey(name: 'account_id') int? accountId,
      @HiveField(2) @JsonKey(name: 'is_employee') bool? isEmployee,
      @HiveField(3) @JsonKey(name: 'last_modified_date') int? lastModifiedDate,
      @HiveField(4) @JsonKey(name: 'last_access_date') int? lastAccessDate,
      @HiveField(5)
      @JsonKey(name: 'reputation_change_year')
      int? reputationChangeYear,
      @HiveField(6)
      @JsonKey(name: 'reputation_change_quarter')
      int? reputationChangeQuarter,
      @HiveField(7)
      @JsonKey(name: 'reputation_change_month')
      int? reputationChangeMonth,
      @HiveField(8)
      @JsonKey(name: 'reputation_change_week')
      int? reputationChangeWeek,
      @HiveField(9)
      @JsonKey(name: 'reputation_change_day')
      int? reputationChangeDay,
      @HiveField(10) @JsonKey(name: 'reputation') int? reputation,
      @HiveField(11) @JsonKey(name: 'creation_date') int? creationDate,
      @HiveField(12) @JsonKey(name: 'user_type') String? userType,
      @HiveField(13) @JsonKey(name: 'user_id') int? userId,
      @HiveField(14) @JsonKey(name: 'accept_rate') int? acceptRate,
      @HiveField(15) @JsonKey(name: 'location') String? location,
      @HiveField(16) @JsonKey(name: 'website_url') String? websiteUrl,
      @HiveField(17) @JsonKey(name: 'link') String? link,
      @HiveField(18) @JsonKey(name: 'profile_image') String? profileImage,
      @HiveField(19) @JsonKey(name: 'display_name') String? displayName});

  @override
  $SofBadgeModelCopyWith<$Res>? get badgeCounts;
}

/// @nodoc
class __$$SofUserModelImplCopyWithImpl<$Res>
    extends _$SofUserModelCopyWithImpl<$Res, _$SofUserModelImpl>
    implements _$$SofUserModelImplCopyWith<$Res> {
  __$$SofUserModelImplCopyWithImpl(
      _$SofUserModelImpl _value, $Res Function(_$SofUserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgeCounts = freezed,
    Object? accountId = freezed,
    Object? isEmployee = freezed,
    Object? lastModifiedDate = freezed,
    Object? lastAccessDate = freezed,
    Object? reputationChangeYear = freezed,
    Object? reputationChangeQuarter = freezed,
    Object? reputationChangeMonth = freezed,
    Object? reputationChangeWeek = freezed,
    Object? reputationChangeDay = freezed,
    Object? reputation = freezed,
    Object? creationDate = freezed,
    Object? userType = freezed,
    Object? userId = freezed,
    Object? acceptRate = freezed,
    Object? location = freezed,
    Object? websiteUrl = freezed,
    Object? link = freezed,
    Object? profileImage = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$SofUserModelImpl(
      badgeCounts: freezed == badgeCounts
          ? _value.badgeCounts
          : badgeCounts // ignore: cast_nullable_to_non_nullable
              as SofBadgeModel?,
      accountId: freezed == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmployee: freezed == isEmployee
          ? _value.isEmployee
          : isEmployee // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as int?,
      lastAccessDate: freezed == lastAccessDate
          ? _value.lastAccessDate
          : lastAccessDate // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeYear: freezed == reputationChangeYear
          ? _value.reputationChangeYear
          : reputationChangeYear // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeQuarter: freezed == reputationChangeQuarter
          ? _value.reputationChangeQuarter
          : reputationChangeQuarter // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeMonth: freezed == reputationChangeMonth
          ? _value.reputationChangeMonth
          : reputationChangeMonth // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeWeek: freezed == reputationChangeWeek
          ? _value.reputationChangeWeek
          : reputationChangeWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      reputationChangeDay: freezed == reputationChangeDay
          ? _value.reputationChangeDay
          : reputationChangeDay // ignore: cast_nullable_to_non_nullable
              as int?,
      reputation: freezed == reputation
          ? _value.reputation
          : reputation // ignore: cast_nullable_to_non_nullable
              as int?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      acceptRate: freezed == acceptRate
          ? _value.acceptRate
          : acceptRate // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: AppStoreKeys.sofUserAdapterId, adapterName: 'SofUserAdapter')
class _$SofUserModelImpl implements _SofUserModel {
  const _$SofUserModelImpl(
      {@HiveField(0) @JsonKey(name: 'badge_counts') this.badgeCounts,
      @HiveField(1) @JsonKey(name: 'account_id') this.accountId,
      @HiveField(2) @JsonKey(name: 'is_employee') this.isEmployee,
      @HiveField(3) @JsonKey(name: 'last_modified_date') this.lastModifiedDate,
      @HiveField(4) @JsonKey(name: 'last_access_date') this.lastAccessDate,
      @HiveField(5)
      @JsonKey(name: 'reputation_change_year')
      this.reputationChangeYear,
      @HiveField(6)
      @JsonKey(name: 'reputation_change_quarter')
      this.reputationChangeQuarter,
      @HiveField(7)
      @JsonKey(name: 'reputation_change_month')
      this.reputationChangeMonth,
      @HiveField(8)
      @JsonKey(name: 'reputation_change_week')
      this.reputationChangeWeek,
      @HiveField(9)
      @JsonKey(name: 'reputation_change_day')
      this.reputationChangeDay,
      @HiveField(10) @JsonKey(name: 'reputation') this.reputation,
      @HiveField(11) @JsonKey(name: 'creation_date') this.creationDate,
      @HiveField(12) @JsonKey(name: 'user_type') this.userType,
      @HiveField(13) @JsonKey(name: 'user_id') this.userId,
      @HiveField(14) @JsonKey(name: 'accept_rate') this.acceptRate,
      @HiveField(15) @JsonKey(name: 'location') this.location,
      @HiveField(16) @JsonKey(name: 'website_url') this.websiteUrl,
      @HiveField(17) @JsonKey(name: 'link') this.link,
      @HiveField(18) @JsonKey(name: 'profile_image') this.profileImage,
      @HiveField(19) @JsonKey(name: 'display_name') this.displayName});

  factory _$SofUserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SofUserModelImplFromJson(json);

  @override
  @HiveField(0)
  @JsonKey(name: 'badge_counts')
  final SofBadgeModel? badgeCounts;
  @override
  @HiveField(1)
  @JsonKey(name: 'account_id')
  final int? accountId;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_employee')
  final bool? isEmployee;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_modified_date')
  final int? lastModifiedDate;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_access_date')
  final int? lastAccessDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'reputation_change_year')
  final int? reputationChangeYear;
  @override
  @HiveField(6)
  @JsonKey(name: 'reputation_change_quarter')
  final int? reputationChangeQuarter;
  @override
  @HiveField(7)
  @JsonKey(name: 'reputation_change_month')
  final int? reputationChangeMonth;
  @override
  @HiveField(8)
  @JsonKey(name: 'reputation_change_week')
  final int? reputationChangeWeek;
  @override
  @HiveField(9)
  @JsonKey(name: 'reputation_change_day')
  final int? reputationChangeDay;
  @override
  @HiveField(10)
  @JsonKey(name: 'reputation')
  final int? reputation;
  @override
  @HiveField(11)
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  @override
  @HiveField(12)
  @JsonKey(name: 'user_type')
  final String? userType;
  @override
  @HiveField(13)
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @HiveField(14)
  @JsonKey(name: 'accept_rate')
  final int? acceptRate;
  @override
  @HiveField(15)
  @JsonKey(name: 'location')
  final String? location;
  @override
  @HiveField(16)
  @JsonKey(name: 'website_url')
  final String? websiteUrl;
  @override
  @HiveField(17)
  @JsonKey(name: 'link')
  final String? link;
  @override
  @HiveField(18)
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @HiveField(19)
  @JsonKey(name: 'display_name')
  final String? displayName;

  @override
  String toString() {
    return 'SofUserModel(badgeCounts: $badgeCounts, accountId: $accountId, isEmployee: $isEmployee, lastModifiedDate: $lastModifiedDate, lastAccessDate: $lastAccessDate, reputationChangeYear: $reputationChangeYear, reputationChangeQuarter: $reputationChangeQuarter, reputationChangeMonth: $reputationChangeMonth, reputationChangeWeek: $reputationChangeWeek, reputationChangeDay: $reputationChangeDay, reputation: $reputation, creationDate: $creationDate, userType: $userType, userId: $userId, acceptRate: $acceptRate, location: $location, websiteUrl: $websiteUrl, link: $link, profileImage: $profileImage, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SofUserModelImpl &&
            (identical(other.badgeCounts, badgeCounts) ||
                other.badgeCounts == badgeCounts) &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.isEmployee, isEmployee) ||
                other.isEmployee == isEmployee) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.lastAccessDate, lastAccessDate) ||
                other.lastAccessDate == lastAccessDate) &&
            (identical(other.reputationChangeYear, reputationChangeYear) ||
                other.reputationChangeYear == reputationChangeYear) &&
            (identical(
                    other.reputationChangeQuarter, reputationChangeQuarter) ||
                other.reputationChangeQuarter == reputationChangeQuarter) &&
            (identical(other.reputationChangeMonth, reputationChangeMonth) ||
                other.reputationChangeMonth == reputationChangeMonth) &&
            (identical(other.reputationChangeWeek, reputationChangeWeek) ||
                other.reputationChangeWeek == reputationChangeWeek) &&
            (identical(other.reputationChangeDay, reputationChangeDay) ||
                other.reputationChangeDay == reputationChangeDay) &&
            (identical(other.reputation, reputation) ||
                other.reputation == reputation) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.acceptRate, acceptRate) ||
                other.acceptRate == acceptRate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        badgeCounts,
        accountId,
        isEmployee,
        lastModifiedDate,
        lastAccessDate,
        reputationChangeYear,
        reputationChangeQuarter,
        reputationChangeMonth,
        reputationChangeWeek,
        reputationChangeDay,
        reputation,
        creationDate,
        userType,
        userId,
        acceptRate,
        location,
        websiteUrl,
        link,
        profileImage,
        displayName
      ]);

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SofUserModelImplCopyWith<_$SofUserModelImpl> get copyWith =>
      __$$SofUserModelImplCopyWithImpl<_$SofUserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SofUserModelImplToJson(
      this,
    );
  }
}

abstract class _SofUserModel implements SofUserModel {
  const factory _SofUserModel(
      {@HiveField(0)
      @JsonKey(name: 'badge_counts')
      final SofBadgeModel? badgeCounts,
      @HiveField(1) @JsonKey(name: 'account_id') final int? accountId,
      @HiveField(2) @JsonKey(name: 'is_employee') final bool? isEmployee,
      @HiveField(3)
      @JsonKey(name: 'last_modified_date')
      final int? lastModifiedDate,
      @HiveField(4)
      @JsonKey(name: 'last_access_date')
      final int? lastAccessDate,
      @HiveField(5)
      @JsonKey(name: 'reputation_change_year')
      final int? reputationChangeYear,
      @HiveField(6)
      @JsonKey(name: 'reputation_change_quarter')
      final int? reputationChangeQuarter,
      @HiveField(7)
      @JsonKey(name: 'reputation_change_month')
      final int? reputationChangeMonth,
      @HiveField(8)
      @JsonKey(name: 'reputation_change_week')
      final int? reputationChangeWeek,
      @HiveField(9)
      @JsonKey(name: 'reputation_change_day')
      final int? reputationChangeDay,
      @HiveField(10) @JsonKey(name: 'reputation') final int? reputation,
      @HiveField(11) @JsonKey(name: 'creation_date') final int? creationDate,
      @HiveField(12) @JsonKey(name: 'user_type') final String? userType,
      @HiveField(13) @JsonKey(name: 'user_id') final int? userId,
      @HiveField(14) @JsonKey(name: 'accept_rate') final int? acceptRate,
      @HiveField(15) @JsonKey(name: 'location') final String? location,
      @HiveField(16) @JsonKey(name: 'website_url') final String? websiteUrl,
      @HiveField(17) @JsonKey(name: 'link') final String? link,
      @HiveField(18) @JsonKey(name: 'profile_image') final String? profileImage,
      @HiveField(19)
      @JsonKey(name: 'display_name')
      final String? displayName}) = _$SofUserModelImpl;

  factory _SofUserModel.fromJson(Map<String, dynamic> json) =
      _$SofUserModelImpl.fromJson;

  @override
  @HiveField(0)
  @JsonKey(name: 'badge_counts')
  SofBadgeModel? get badgeCounts;
  @override
  @HiveField(1)
  @JsonKey(name: 'account_id')
  int? get accountId;
  @override
  @HiveField(2)
  @JsonKey(name: 'is_employee')
  bool? get isEmployee;
  @override
  @HiveField(3)
  @JsonKey(name: 'last_modified_date')
  int? get lastModifiedDate;
  @override
  @HiveField(4)
  @JsonKey(name: 'last_access_date')
  int? get lastAccessDate;
  @override
  @HiveField(5)
  @JsonKey(name: 'reputation_change_year')
  int? get reputationChangeYear;
  @override
  @HiveField(6)
  @JsonKey(name: 'reputation_change_quarter')
  int? get reputationChangeQuarter;
  @override
  @HiveField(7)
  @JsonKey(name: 'reputation_change_month')
  int? get reputationChangeMonth;
  @override
  @HiveField(8)
  @JsonKey(name: 'reputation_change_week')
  int? get reputationChangeWeek;
  @override
  @HiveField(9)
  @JsonKey(name: 'reputation_change_day')
  int? get reputationChangeDay;
  @override
  @HiveField(10)
  @JsonKey(name: 'reputation')
  int? get reputation;
  @override
  @HiveField(11)
  @JsonKey(name: 'creation_date')
  int? get creationDate;
  @override
  @HiveField(12)
  @JsonKey(name: 'user_type')
  String? get userType;
  @override
  @HiveField(13)
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @HiveField(14)
  @JsonKey(name: 'accept_rate')
  int? get acceptRate;
  @override
  @HiveField(15)
  @JsonKey(name: 'location')
  String? get location;
  @override
  @HiveField(16)
  @JsonKey(name: 'website_url')
  String? get websiteUrl;
  @override
  @HiveField(17)
  @JsonKey(name: 'link')
  String? get link;
  @override
  @HiveField(18)
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @HiveField(19)
  @JsonKey(name: 'display_name')
  String? get displayName;

  /// Create a copy of SofUserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SofUserModelImplCopyWith<_$SofUserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
