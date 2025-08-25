
class RateingModel {
  final String productId;
  final String rating;

  RateingModel({required this.productId, required this.rating});
  factory RateingModel.fromJson(Map<String, dynamic> jsonData) {
    return RateingModel(
      productId: jsonData["productId"],
      rating: jsonData["rating"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
      "rating": rating,
    };
  }
}
