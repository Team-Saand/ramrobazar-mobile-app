// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUserInfoDTO _$GetUserInfoDTOFromJson(Map<String, dynamic> json) =>
    GetUserInfoDTO(
      data: AuthApiModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetUserInfoDTOToJson(GetUserInfoDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
