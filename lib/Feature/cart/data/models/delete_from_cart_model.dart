class DeleteFromCartModel {

  final String productId;
  DeleteFromCartModel({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
    };
  }
}