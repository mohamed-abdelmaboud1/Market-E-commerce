class AddToFavModel {

  final String productId;
  AddToFavModel({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
    };
  }
}