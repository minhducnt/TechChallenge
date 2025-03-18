// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof.badge.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SofBadgeAdapter extends TypeAdapter<_$SofBadgeModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$SofBadgeModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SofBadgeModelImpl(
      bronze: fields[0] == null ? 0 : fields[0] as int?,
      silver: fields[1] == null ? 0 : fields[1] as int?,
      gold: fields[2] == null ? 0 : fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SofBadgeModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.bronze)
      ..writeByte(1)
      ..write(obj.silver)
      ..writeByte(2)
      ..write(obj.gold);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SofBadgeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SofBadgeModelImpl _$$SofBadgeModelImplFromJson(Map<String, dynamic> json) =>
    _$SofBadgeModelImpl(
      bronze: (json['bronze'] as num?)?.toInt(),
      silver: (json['silver'] as num?)?.toInt(),
      gold: (json['gold'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SofBadgeModelImplToJson(_$SofBadgeModelImpl instance) =>
    <String, dynamic>{
      'bronze': instance.bronze,
      'silver': instance.silver,
      'gold': instance.gold,
    };
