import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';

abstract class GetCartState {}

class GetCartInitial extends GetCartState {}

class GetCartLoading extends GetCartState {}

class GetCartLoaded extends GetCartState {
  final List<ProductModel> products;

  GetCartLoaded(this.products);
}

class GetCartError extends GetCartState {
  final String errMessage;

  GetCartError(this.errMessage);
}
