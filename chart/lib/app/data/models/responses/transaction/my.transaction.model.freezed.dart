// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my.transaction.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MyTransaction _$MyTransactionFromJson(Map<String, dynamic> json) {
  return _MyTransaction.fromJson(json);
}

/// @nodoc
mixin _$MyTransaction {
  String? get day => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;

  /// Serializes this MyTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MyTransactionCopyWith<MyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyTransactionCopyWith<$Res> {
  factory $MyTransactionCopyWith(
          MyTransaction value, $Res Function(MyTransaction) then) =
      _$MyTransactionCopyWithImpl<$Res, MyTransaction>;
  @useResult
  $Res call({String? day, double? amount});
}

/// @nodoc
class _$MyTransactionCopyWithImpl<$Res, $Val extends MyTransaction>
    implements $MyTransactionCopyWith<$Res> {
  _$MyTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyTransactionImplCopyWith<$Res>
    implements $MyTransactionCopyWith<$Res> {
  factory _$$MyTransactionImplCopyWith(
          _$MyTransactionImpl value, $Res Function(_$MyTransactionImpl) then) =
      __$$MyTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? day, double? amount});
}

/// @nodoc
class __$$MyTransactionImplCopyWithImpl<$Res>
    extends _$MyTransactionCopyWithImpl<$Res, _$MyTransactionImpl>
    implements _$$MyTransactionImplCopyWith<$Res> {
  __$$MyTransactionImplCopyWithImpl(
      _$MyTransactionImpl _value, $Res Function(_$MyTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$MyTransactionImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MyTransactionImpl implements _MyTransaction {
  const _$MyTransactionImpl({this.day, this.amount});

  factory _$MyTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MyTransactionImplFromJson(json);

  @override
  final String? day;
  @override
  final double? amount;

  @override
  String toString() {
    return 'MyTransaction(day: $day, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyTransactionImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, amount);

  /// Create a copy of MyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MyTransactionImplCopyWith<_$MyTransactionImpl> get copyWith =>
      __$$MyTransactionImplCopyWithImpl<_$MyTransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MyTransactionImplToJson(
      this,
    );
  }
}

abstract class _MyTransaction implements MyTransaction {
  const factory _MyTransaction({final String? day, final double? amount}) =
      _$MyTransactionImpl;

  factory _MyTransaction.fromJson(Map<String, dynamic> json) =
      _$MyTransactionImpl.fromJson;

  @override
  String? get day;
  @override
  double? get amount;

  /// Create a copy of MyTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MyTransactionImplCopyWith<_$MyTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
