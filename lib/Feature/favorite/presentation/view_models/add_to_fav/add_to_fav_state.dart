import 'package:marketi_ecommers/Feature/favorite/data/models/add_to_fav_model.dart';

abstract class AddToFavState {}

class AddToFavInitial extends AddToFavState {}

class AddToFavLoading extends AddToFavState {}

class AddToFavLoaded extends AddToFavState {
  final List<AddToFavModel> addProducts;

  AddToFavLoaded(this.addProducts);
}

class AddToFavError extends AddToFavState {
  final String errMessage;

  AddToFavError(this.errMessage);
}
