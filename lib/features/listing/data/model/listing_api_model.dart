import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/listing_entity.dart';

part 'listing_api_model.g.dart';

final listingApiModelProvider = Provider<ListingApiModel>(
  (ref) => ListingApiModel.empty(),
);

@JsonSerializable()
class ListingApiModel {
  @JsonKey(name: 'id')
  final String id;
  final String title;
  final String price;
  final String location;
  final String description;
  final List<String> images;
  final String username;
  final String phoneNumber;
  final String views;
  final String negotiable;
  final String category;

  ListingApiModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.location,
      required this.description,
      required this.images,
      required this.username,
      required this.views,
      required this.phoneNumber,
      required this.negotiable,
      required this.category});

  ListingApiModel.empty()
      : id = '',
        title = '',
        price = '',
        location = '',
        description = '',
        images = [],
        username = '',
        views = '',
        phoneNumber = '',
        negotiable = '',
        category = '';

  factory ListingApiModel.fromJson(Map<String, dynamic> json) =>
      _$ListingApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListingApiModelToJson(this);

  ListingEntity toEntity() => ListingEntity(
      id: id,
      title: title,
      price: price,
      location: location,
      description: description,
      images: images,
      username: username,
      views: views,
      phoneNumber: phoneNumber,
      negotiable: negotiable,
      category: category);

  // Convert Hive List to Entity List
  List<ListingEntity> toEntityList(List<ListingApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  ListingEntity toListingEntity(ListingApiModel model) => model.toEntity();

  ListingApiModel customFromJson(Map<String, dynamic> json) => ListingApiModel(
        id: json['id'] as String,
        title: json['title'] as String,
        price: json['price'] as String,
        location: json['location'] as String,
        description: json['description'] as String,
        username: json['username'] as String,
        phoneNumber: json['phoneNumber'] as String,
        views: json['views'] as String,
        negotiable: json['negotiable'] as String,
        category: json['category'] as String,
        images: json['images'] as List<String>,
      );

  @override
  String toString() {
    return 'ListingApiModel(id: $id, title: $title, price: $price, location: $location, description: $description, username: $username, views: $views, images: $images)';
  }
}
