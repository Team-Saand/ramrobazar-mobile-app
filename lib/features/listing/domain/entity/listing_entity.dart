class ListingEntity {
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

  const ListingEntity(
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

  factory ListingEntity.fromJson(Map<String, dynamic> json) => ListingEntity(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        location: json['location'],
        description: json['description'],
        images: json['images'],
        username: json['username'],
        phoneNumber: json['medicationPhoto'],
        views: json['views'],
        negotiable: json['negotiable'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'location': location,
        'description': description,
        'images': images,
        'username': username,
        'medicationPhoto': phoneNumber,
        'views': views,
        'negotiable': negotiable,
        'category': category
      };
}
