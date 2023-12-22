import 'package:json_annotation/json_annotation.dart';

import '../model/listing_api_model.dart';

part 'get_all_listing_dto.g.dart';

@JsonSerializable()
class GetListingDTO {
  final List<ListingApiModel> data;

  GetListingDTO({
    required this.data,
  });
  
  factory GetListingDTO.fromJson(Map<String, dynamic> json) =>
      _$GetListingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetListingDTOToJson(this);

  
}
