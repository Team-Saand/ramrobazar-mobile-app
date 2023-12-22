import 'package:json_annotation/json_annotation.dart';

part 'get_single_listing_dto.g.dart';

@JsonSerializable()
class GetSingleListingDTO {
  final List<dynamic> data;

  GetSingleListingDTO({
    required this.data,
  });
  
  factory GetSingleListingDTO.fromJson(Map<String, dynamic> json) =>
      _$GetSingleListingDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetSingleListingDTOToJson(this);

  
}
