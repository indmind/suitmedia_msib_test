// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/user_model.dart';

part 'user_response_entity.freezed.dart';
part 'user_response_entity.g.dart';

@freezed
class UserResponseEntity with _$UserResponseEntity {
  factory UserResponseEntity({
    int? page,
    @JsonKey(name: 'per_page') int? perPage,
    int? total,
    @JsonKey(name: 'total_pages') int? totalPages,
    List<UserModel>? data,
  }) = _UserResponseEntity;

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserResponseEntityFromJson(json);
}
