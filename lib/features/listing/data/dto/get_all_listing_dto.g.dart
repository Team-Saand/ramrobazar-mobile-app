// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_listing_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetListingDTO _$GetListingDTOFromJson(Map<String, dynamic> json) =>
    GetListingDTO(
      data: (json['data'] as List<dynamic>)
          .map((e) => ListingApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetListingDTOToJson(GetListingDTO instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
