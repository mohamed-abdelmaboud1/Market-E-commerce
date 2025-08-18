class DeleteFromFavModel {

  final String productId;
  DeleteFromFavModel({
    required this.productId,
  });

  Map<String, dynamic> toJson() {
    return {
      "productId": productId,
    };
  }
}