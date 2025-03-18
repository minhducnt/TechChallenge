// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sof.user.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SofUserAdapter extends TypeAdapter<_$SofUserModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$SofUserModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SofUserModelImpl(
      badgeCounts: fields[0] as SofBadgeModel?,
      accountId: fields[1] as int?,
      isEmployee: fields[2] as bool?,
      lastModifiedDate: fields[3] as int?,
      lastAccessDate: fields[4] as int?,
      reputationChangeYear: fields[5] as int?,
      reputationChangeQuarter: fields[6] as int?,
      reputationChangeMonth: fields[7] as int?,
      reputationChangeWeek: fields[8] as int?,
      reputationChangeDay: fields[9] as int?,
      reputation: fields[10] as int?,
      creationDate: fields[11] as int?,
      userType: fields[12] as String?,
      userId: fields[13] as int?,
      acceptRate: fields[14] as int?,
      location: fields[15] as String?,
      websiteUrl: fields[16] as String?,
      link: fields[17] as String?,
      profileImage: fields[18] as String?,
      displayName: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$SofUserModelImpl obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.badgeCounts)
      ..writeByte(1)
      ..write(obj.accountId)
      ..writeByte(2)
      ..write(obj.isEmployee)
      ..writeByte(3)
      ..write(obj.lastModifiedDate)
      ..writeByte(4)
      ..write(obj.lastAccessDate)
      ..writeByte(5)
      ..write(obj.reputationChangeYear)
      ..writeByte(6)
      ..write(obj.reputationChangeQuarter)
      ..writeByte(7)
      ..write(obj.reputationChangeMonth)
      ..writeByte(8)
      ..write(obj.reputationChangeWeek)
      ..writeByte(9)
      ..write(obj.reputationChangeDay)
      ..writeByte(10)
      ..write(obj.reputation)
      ..writeByte(11)
      ..write(obj.creationDate)
      ..writeByte(12)
      ..write(obj.userType)
      ..writeByte(13)
      ..write(obj.userId)
      ..writeByte(14)
      ..write(obj.acceptRate)
      ..writeByte(15)
      ..write(obj.location)
      ..writeByte(16)
      ..write(obj.websiteUrl)
      ..writeByte(17)
      ..write(obj.link)
      ..writeByte(18)
      ..write(obj.profileImage)
      ..writeByte(19)
      ..write(obj.displayName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SofUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SofUserModelImpl _$$SofUserModelImplFromJson(Map<String, dynamic> json) =>
    _$SofUserModelImpl(
      badgeCounts: json['badge_counts'] == null
          ? null
          : SofBadgeModel.fromJson(
              json['badge_counts'] as Map<String, dynamic>),
      accountId: (json['account_id'] as num?)?.toInt(),
      isEmployee: json['is_employee'] as bool?,
      lastModifiedDate: (json['last_modified_date'] as num?)?.toInt(),
      lastAccessDate: (json['last_access_date'] as num?)?.toInt(),
      reputationChangeYear: (json['reputation_change_year'] as num?)?.toInt(),
      reputationChangeQuarter:
          (json['reputation_change_quarter'] as num?)?.toInt(),
      reputationChangeMonth: (json['reputation_change_month'] as num?)?.toInt(),
      reputationChangeWeek: (json['reputation_change_week'] as num?)?.toInt(),
      reputationChangeDay: (json['reputation_change_day'] as num?)?.toInt(),
      reputation: (json['reputation'] as num?)?.toInt(),
      creationDate: (json['creation_date'] as num?)?.toInt(),
      userType: json['user_type'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      acceptRate: (json['accept_rate'] as num?)?.toInt(),
      location: json['location'] as String?,
      websiteUrl: json['website_url'] as String?,
      link: json['link'] as String?,
      profileImage: json['profile_image'] as String?,
      displayName: json['display_name'] as String?,
    );

Map<String, dynamic> _$$SofUserModelImplToJson(_$SofUserModelImpl instance) =>
    <String, dynamic>{
      'badge_counts': instance.badgeCounts,
      'account_id': instance.accountId,
      'is_employee': instance.isEmployee,
      'last_modified_date': instance.lastModifiedDate,
      'last_access_date': instance.lastAccessDate,
      'reputation_change_year': instance.reputationChangeYear,
      'reputation_change_quarter': instance.reputationChangeQuarter,
      'reputation_change_month': instance.reputationChangeMonth,
      'reputation_change_week': instance.reputationChangeWeek,
      'reputation_change_day': instance.reputationChangeDay,
      'reputation': instance.reputation,
      'creation_date': instance.creationDate,
      'user_type': instance.userType,
      'user_id': instance.userId,
      'accept_rate': instance.acceptRate,
      'location': instance.location,
      'website_url': instance.websiteUrl,
      'link': instance.link,
      'profile_image': instance.profileImage,
      'display_name': instance.displayName,
    };
