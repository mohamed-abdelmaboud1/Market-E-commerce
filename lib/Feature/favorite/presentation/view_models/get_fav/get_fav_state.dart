import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';

abstract class GetFavState {}

class GetFavInitial extends GetFavState {}
class GetFavLoading extends GetFavState {}
class GetFavLoaded extends GetFavState {
  final List<ProductModel> products;

  GetFavLoaded(this.products);
}

class GetFavError extends GetFavState {
  final String errMessage;

  GetFavError(this.errMessage);
}
