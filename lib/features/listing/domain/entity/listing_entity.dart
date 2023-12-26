class ListingEntity {
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

  const ListingEntity(
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

  factory ListingEntity.fromJson(Map<String, dynamic> json) => ListingEntity(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        location: json['location'],
        description: json['description'],
        images: json['images'],
        username: json['username'],
        phone: json['phone'],
        views: json['views'],
        condition: json['condition'],
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
        'phone': phone,
        'views': views,
        'condition': condition,
        'category': category
      };

      @override
        toString() {return 'title: $title, price: $price, \n condition: $condition location: $location, description: $description ';}
}
