// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingApiModel _$ListingApiModelFromJson(Map<String, dynamic> json) =>
    ListingApiModel(
      id: json['id'] as String,
      title: json['title'] as String,
      price: json['price'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      username: json['username'] as String,
      views: json['views'] as String,
      phone: json['phone'] as String,
      negotiable: json['negotiable'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$ListingApiModelToJson(ListingApiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'location': instance.location,
      'description': instance.description,
      'images': instance.images,
      'username': instance.username,
      'phone': instance.phone,
      'views': instance.views,
      'negotiable': instance.negotiable,
      'category': instance.category,
    };
