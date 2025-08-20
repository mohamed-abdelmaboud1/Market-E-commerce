
import '../../../data/models/checkout_model_product.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
final List<CheckOutModelProduct> checkedOutProducts;

  CheckoutLoaded(this.checkedOutProducts);
}

class CheckoutError extends CheckoutState {
  final String errMessage;

  CheckoutError(this.errMessage);
}
