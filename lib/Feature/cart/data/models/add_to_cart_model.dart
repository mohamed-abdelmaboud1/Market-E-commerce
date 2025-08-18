class AddToCartModel {

  final String productId;
  AddToCartModel({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
    };
  }
}