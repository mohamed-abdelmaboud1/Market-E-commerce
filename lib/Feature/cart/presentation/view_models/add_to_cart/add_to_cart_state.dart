import 'package:marketi_ecommers/Feature/cart/data/models/add_to_cart_model.dart';

abstract class AddToCartState {}

class AddToCartInitial extends AddToCartState {}

class AddToCartLoading extends AddToCartState {}

class AddToCartLoaded extends AddToCartState {
  final List<AddToCartModel> addProducts;

  AddToCartLoaded(this.addProducts);
}

class AddToCartError extends AddToCartState {
  final String errMessage;

  AddToCartError(this.errMessage);
}
