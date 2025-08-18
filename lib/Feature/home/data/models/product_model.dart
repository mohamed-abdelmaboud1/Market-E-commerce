class ProductModel {
  final String id;
  final String title;
  final String description;
  final int price;
  final List<String> images;
  final String brand;
  final String category;
  final double? rating;
  int? discount;
   int? remain;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.brand,
    required this.category,
    this.rating,
    this.discount,
    this.remain ,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images']),
      brand: json['brand'],
      category: json['category'],
      rating: json['rating']?.toDouble(),
      discount: json['discount'] ?? 0,
      remain: json['remain'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, price: $price, brand: $brand, image url : $images)';
  }
}
