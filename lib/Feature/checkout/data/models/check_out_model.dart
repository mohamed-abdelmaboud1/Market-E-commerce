import 'package:marketi_ecommers/Feature/checkout/data/models/checkout_model_product.dart';

class CheckOutModel {
  final List<CheckOutModelProduct> products;
  final String userId;
  CheckOutModel({
    required this.products,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "products": products.map((product) => product.toJson()).toList(),
    };
  }
}
