// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sof.badge.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SofBadgeModel _$SofBadgeModelFromJson(Map<String, dynamic> json) {
  return _SofBadgeModel.fromJson(json);
}

/// @nodoc
mixin _$SofBadgeModel {
  @HiveField(0, defaultValue: 0)
  int? get bronze => throw _privateConstructorUsedError;
  @HiveField(1, defaultValue: 0)
  int? get silver => throw _privateConstructorUsedError;
  @HiveField(2, defaultValue: 0)
  int? get gold => throw _privateConstructorUsedError;

  /// Serializes this SofBadgeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SofBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SofBadgeModelCopyWith<SofBadgeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SofBadgeModelCopyWith<$Res> {
  factory $SofBadgeModelCopyWith(
          SofBadgeModel value, $Res Function(SofBadgeModel) then) =
      _$SofBadgeModelCopyWithImpl<$Res, SofBadgeModel>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0) int? bronze,
      @HiveField(1, defaultValue: 0) int? silver,
      @HiveField(2, defaultValue: 0) int? gold});
}

/// @nodoc
class _$SofBadgeModelCopyWithImpl<$Res, $Val extends SofBadgeModel>
    implements $SofBadgeModelCopyWith<$Res> {
  _$SofBadgeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SofBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bronze = freezed,
    Object? silver = freezed,
    Object? gold = freezed,
  }) {
    return _then(_value.copyWith(
      bronze: freezed == bronze
          ? _value.bronze
          : bronze // ignore: cast_nullable_to_non_nullable
              as int?,
      silver: freezed == silver
          ? _value.silver
          : silver // ignore: cast_nullable_to_non_nullable
              as int?,
      gold: freezed == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SofBadgeModelImplCopyWith<$Res>
    implements $SofBadgeModelCopyWith<$Res> {
  factory _$$SofBadgeModelImplCopyWith(
          _$SofBadgeModelImpl value, $Res Function(_$SofBadgeModelImpl) then) =
      __$$SofBadgeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0) int? bronze,
      @HiveField(1, defaultValue: 0) int? silver,
      @HiveField(2, defaultValue: 0) int? gold});
}

/// @nodoc
class __$$SofBadgeModelImplCopyWithImpl<$Res>
    extends _$SofBadgeModelCopyWithImpl<$Res, _$SofBadgeModelImpl>
    implements _$$SofBadgeModelImplCopyWith<$Res> {
  __$$SofBadgeModelImplCopyWithImpl(
      _$SofBadgeModelImpl _value, $Res Function(_$SofBadgeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SofBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bronze = freezed,
    Object? silver = freezed,
    Object? gold = freezed,
  }) {
    return _then(_$SofBadgeModelImpl(
      bronze: freezed == bronze
          ? _value.bronze
          : bronze // ignore: cast_nullable_to_non_nullable
              as int?,
      silver: freezed == silver
          ? _value.silver
          : silver // ignore: cast_nullable_to_non_nullable
              as int?,
      gold: freezed == gold
          ? _value.gold
          : gold // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(
    typeId: AppStoreKeys.sofBadgeAdapterId, adapterName: 'SofBadgeAdapter')
class _$SofBadgeModelImpl implements _SofBadgeModel {
  _$SofBadgeModelImpl(
      {@HiveField(0, defaultValue: 0) this.bronze,
      @HiveField(1, defaultValue: 0) this.silver,
      @HiveField(2, defaultValue: 0) this.gold});

  factory _$SofBadgeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SofBadgeModelImplFromJson(json);

  @override
  @HiveField(0, defaultValue: 0)
  final int? bronze;
  @override
  @HiveField(1, defaultValue: 0)
  final int? silver;
  @override
  @HiveField(2, defaultValue: 0)
  final int? gold;

  @override
  String toString() {
    return 'SofBadgeModel(bronze: $bronze, silver: $silver, gold: $gold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SofBadgeModelImpl &&
            (identical(other.bronze, bronze) || other.bronze == bronze) &&
            (identical(other.silver, silver) || other.silver == silver) &&
            (identical(other.gold, gold) || other.gold == gold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bronze, silver, gold);

  /// Create a copy of SofBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SofBadgeModelImplCopyWith<_$SofBadgeModelImpl> get copyWith =>
      __$$SofBadgeModelImplCopyWithImpl<_$SofBadgeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SofBadgeModelImplToJson(
      this,
    );
  }
}

abstract class _SofBadgeModel implements SofBadgeModel {
  factory _SofBadgeModel(
      {@HiveField(0, defaultValue: 0) final int? bronze,
      @HiveField(1, defaultValue: 0) final int? silver,
      @HiveField(2, defaultValue: 0) final int? gold}) = _$SofBadgeModelImpl;

  factory _SofBadgeModel.fromJson(Map<String, dynamic> json) =
      _$SofBadgeModelImpl.fromJson;

  @override
  @HiveField(0, defaultValue: 0)
  int? get bronze;
  @override
  @HiveField(1, defaultValue: 0)
  int? get silver;
  @override
  @HiveField(2, defaultValue: 0)
  int? get gold;

  /// Create a copy of SofBadgeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SofBadgeModelImplCopyWith<_$SofBadgeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
