// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingApiModel _$ListingApiModelFromJson(Map<String, dynamic> json) =>
    ListingApiModel(
      id: json['id'].toString() as String,
      title: json['name'] as String,
      price: json['price'].toString() as String,
      location: json['location'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      username: json['username']?? '' as String,
      views: json['views'] ?? '0' as String,
      phone: json['phone'].toString() ?? '0' as String,
      condition: json['condition'] as String,
      category: json['category'] ?? 'smth' as String,
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
      'condition': instance.condition,
      'category': instance.category,
    };
