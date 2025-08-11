class BrandOrCategoriesModel {
  final String id;
  final String name;
  final String ImagePath;

  BrandOrCategoriesModel({required this.id, required this.name, required this.ImagePath});

  factory BrandOrCategoriesModel.fromJson(Map<String, dynamic> json) {
    return BrandOrCategoriesModel(
        id: json['_id'], name: json['name'], ImagePath: json['imagePath'].replaceAll('\\', '/'));
  }
}
