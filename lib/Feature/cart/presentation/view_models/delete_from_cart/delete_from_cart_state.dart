
import '../../../data/models/delete_from_cart_model.dart';

abstract class DeleteFromCartState {}

class DeleteFromCartInitial extends DeleteFromCartState {}

class DeleteFromCartLoading extends DeleteFromCartState {}

class DeleteFromCartLoaded extends DeleteFromCartState {
  final List<DeleteFromCartModel> deleteProducts;

  DeleteFromCartLoaded(this.deleteProducts);
}

class DeleteFromCartError extends DeleteFromCartState {
  final String errMessage;

  DeleteFromCartError(this.errMessage);
}
