// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AlertModel {
  String get message => throw _privateConstructorUsedError;
  AlertType get type => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlertModelCopyWith<AlertModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlertModelCopyWith<$Res> {
  factory $AlertModelCopyWith(
          AlertModel value, $Res Function(AlertModel) then) =
      _$AlertModelCopyWithImpl<$Res, AlertModel>;
  @useResult
  $Res call({String message, AlertType type, int? code, String? response});
}

/// @nodoc
class _$AlertModelCopyWithImpl<$Res, $Val extends AlertModel>
    implements $AlertModelCopyWith<$Res> {
  _$AlertModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? code = freezed,
    Object? response = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlertModelImplCopyWith<$Res>
    implements $AlertModelCopyWith<$Res> {
  factory _$$AlertModelImplCopyWith(
          _$AlertModelImpl value, $Res Function(_$AlertModelImpl) then) =
      __$$AlertModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, AlertType type, int? code, String? response});
}

/// @nodoc
class __$$AlertModelImplCopyWithImpl<$Res>
    extends _$AlertModelCopyWithImpl<$Res, _$AlertModelImpl>
    implements _$$AlertModelImplCopyWith<$Res> {
  __$$AlertModelImplCopyWithImpl(
      _$AlertModelImpl _value, $Res Function(_$AlertModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? type = null,
    Object? code = freezed,
    Object? response = freezed,
  }) {
    return _then(_$AlertModelImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as AlertType,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AlertModelImpl implements _AlertModel {
  const _$AlertModelImpl(
      {required this.message, required this.type, this.code, this.response});

  @override
  final String message;
  @override
  final AlertType type;
  @override
  final int? code;
  @override
  final String? response;

  @override
  String toString() {
    return 'AlertModel(message: $message, type: $type, code: $code, response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlertModelImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, type, code, response);

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      __$$AlertModelImplCopyWithImpl<_$AlertModelImpl>(this, _$identity);
}

abstract class _AlertModel implements AlertModel {
  const factory _AlertModel(
      {required final String message,
      required final AlertType type,
      final int? code,
      final String? response}) = _$AlertModelImpl;

  @override
  String get message;
  @override
  AlertType get type;
  @override
  int? get code;
  @override
  String? get response;

  /// Create a copy of AlertModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlertModelImplCopyWith<_$AlertModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
