
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';

class CheckOutModelProduct {
  final   List<ProductModel> products;

  final int quantity;

  CheckOutModelProduct({
    required  this.products,
    required this.quantity,
  });


  Map<String, dynamic> toJson() {
    return {
      'product': products,
      'quantity': quantity,
    };
  }
}