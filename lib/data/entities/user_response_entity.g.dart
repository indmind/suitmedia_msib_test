// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseEntityImpl _$$UserResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$UserResponseEntityImpl(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserResponseEntityImplToJson(
        _$UserResponseEntityImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
