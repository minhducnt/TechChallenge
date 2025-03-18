// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sof.reputation.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SofReputationModel _$SofReputationModelFromJson(Map<String, dynamic> json) {
  return _SofReputationModel.fromJson(json);
}

/// @nodoc
mixin _$SofReputationModel {
  @JsonKey(name: 'reputation_history_type')
  String? get reputationHistoryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'reputation_change')
  int? get reputationChange => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_id')
  int? get postId => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation_date')
  int? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;

  /// Serializes this SofReputationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SofReputationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SofReputationModelCopyWith<SofReputationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SofReputationModelCopyWith<$Res> {
  factory $SofReputationModelCopyWith(
          SofReputationModel value, $Res Function(SofReputationModel) then) =
      _$SofReputationModelCopyWithImpl<$Res, SofReputationModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_history_type') String? reputationHistoryType,
      @JsonKey(name: 'reputation_change') int? reputationChange,
      @JsonKey(name: 'post_id') int? postId,
      @JsonKey(name: 'creation_date') int? creationDate,
      @JsonKey(name: 'user_id') int? userId});
}

/// @nodoc
class _$SofReputationModelCopyWithImpl<$Res, $Val extends SofReputationModel>
    implements $SofReputationModelCopyWith<$Res> {
  _$SofReputationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SofReputationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationHistoryType = freezed,
    Object? reputationChange = freezed,
    Object? postId = freezed,
    Object? creationDate = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      reputationHistoryType: freezed == reputationHistoryType
          ? _value.reputationHistoryType
          : reputationHistoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      reputationChange: freezed == reputationChange
          ? _value.reputationChange
          : reputationChange // ignore: cast_nullable_to_non_nullable
              as int?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SofReputationModelImplCopyWith<$Res>
    implements $SofReputationModelCopyWith<$Res> {
  factory _$$SofReputationModelImplCopyWith(_$SofReputationModelImpl value,
          $Res Function(_$SofReputationModelImpl) then) =
      __$$SofReputationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reputation_history_type') String? reputationHistoryType,
      @JsonKey(name: 'reputation_change') int? reputationChange,
      @JsonKey(name: 'post_id') int? postId,
      @JsonKey(name: 'creation_date') int? creationDate,
      @JsonKey(name: 'user_id') int? userId});
}

/// @nodoc
class __$$SofReputationModelImplCopyWithImpl<$Res>
    extends _$SofReputationModelCopyWithImpl<$Res, _$SofReputationModelImpl>
    implements _$$SofReputationModelImplCopyWith<$Res> {
  __$$SofReputationModelImplCopyWithImpl(_$SofReputationModelImpl _value,
      $Res Function(_$SofReputationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SofReputationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reputationHistoryType = freezed,
    Object? reputationChange = freezed,
    Object? postId = freezed,
    Object? creationDate = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$SofReputationModelImpl(
      reputationHistoryType: freezed == reputationHistoryType
          ? _value.reputationHistoryType
          : reputationHistoryType // ignore: cast_nullable_to_non_nullable
              as String?,
      reputationChange: freezed == reputationChange
          ? _value.reputationChange
          : reputationChange // ignore: cast_nullable_to_non_nullable
              as int?,
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SofReputationModelImpl implements _SofReputationModel {
  const _$SofReputationModelImpl(
      {@JsonKey(name: 'reputation_history_type') this.reputationHistoryType,
      @JsonKey(name: 'reputation_change') this.reputationChange,
      @JsonKey(name: 'post_id') this.postId,
      @JsonKey(name: 'creation_date') this.creationDate,
      @JsonKey(name: 'user_id') this.userId});

  factory _$SofReputationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SofReputationModelImplFromJson(json);

  @override
  @JsonKey(name: 'reputation_history_type')
  final String? reputationHistoryType;
  @override
  @JsonKey(name: 'reputation_change')
  final int? reputationChange;
  @override
  @JsonKey(name: 'post_id')
  final int? postId;
  @override
  @JsonKey(name: 'creation_date')
  final int? creationDate;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;

  @override
  String toString() {
    return 'SofReputationModel(reputationHistoryType: $reputationHistoryType, reputationChange: $reputationChange, postId: $postId, creationDate: $creationDate, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SofReputationModelImpl &&
            (identical(other.reputationHistoryType, reputationHistoryType) ||
                other.reputationHistoryType == reputationHistoryType) &&
            (identical(other.reputationChange, reputationChange) ||
                other.reputationChange == reputationChange) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reputationHistoryType,
      reputationChange, postId, creationDate, userId);

  /// Create a copy of SofReputationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SofReputationModelImplCopyWith<_$SofReputationModelImpl> get copyWith =>
      __$$SofReputationModelImplCopyWithImpl<_$SofReputationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SofReputationModelImplToJson(
      this,
    );
  }
}

abstract class _SofReputationModel implements SofReputationModel {
  const factory _SofReputationModel(
      {@JsonKey(name: 'reputation_history_type')
      final String? reputationHistoryType,
      @JsonKey(name: 'reputation_change') final int? reputationChange,
      @JsonKey(name: 'post_id') final int? postId,
      @JsonKey(name: 'creation_date') final int? creationDate,
      @JsonKey(name: 'user_id') final int? userId}) = _$SofReputationModelImpl;

  factory _SofReputationModel.fromJson(Map<String, dynamic> json) =
      _$SofReputationModelImpl.fromJson;

  @override
  @JsonKey(name: 'reputation_history_type')
  String? get reputationHistoryType;
  @override
  @JsonKey(name: 'reputation_change')
  int? get reputationChange;
  @override
  @JsonKey(name: 'post_id')
  int? get postId;
  @override
  @JsonKey(name: 'creation_date')
  int? get creationDate;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;

  /// Create a copy of SofReputationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SofReputationModelImplCopyWith<_$SofReputationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
