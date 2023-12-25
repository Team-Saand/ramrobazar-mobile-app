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
  final String? id;
  final String title;
  final String price;
  final String location;
  final String description;
  final List<String>? images;
  final String? username;
  final String? phone;
  final String? views;
  final String condition;
  final String category;

  ListingApiModel(
      {this.id,
      required this.title,
      required this.price,
      required this.location,
      required this.description,
      this.images,
      this.username,
      this.views,
      this.phone,
      required this.condition,
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
        phone = '',
        condition = '',
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
      phone: phone,
      condition: condition,
      category: category);

  // Convert Hive List to Entity List
  List<ListingEntity> toEntityList(List<ListingApiModel> models) =>
      models.map((model) => model.toEntity()).toList();

  ListingEntity toListingEntity(ListingApiModel model) => model.toEntity();

  ListingApiModel customFromJson(Map<String, dynamic> json) => ListingApiModel(
        id: json['id'].toString(),
        title: json['name'] as String,
        price: json['price'].toString(),
        location: json['location'] as String,
        description: json['description'] as String,
        username: json['username'] as String,
        phone: json['phone'].toString(),
        views: json['views'].toString(),
        condition: json['condition'] as String,
        category: json['category'] as String,
        images: json['images'] as List<String>,
      );

  @override
  String toString() {
    return 'ListingApiModel(id: $id, title: $title, price: $price, location: $location, description: $description, username: $username, views: $views, images: $images)';
  }
}
