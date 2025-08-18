
import '../../../data/models/delete_from_fav_model.dart';

abstract class DeleteFromFavState {}

class DeleteFromFavInitial extends DeleteFromFavState {}

class DeleteFromFavLoading extends DeleteFromFavState {}

class DeleteFromFavLoaded extends DeleteFromFavState {
  final List<DeleteFromFavModel> deleteProducts;

  DeleteFromFavLoaded(this.deleteProducts);
}

class DeleteFromFavError extends DeleteFromFavState {
  final String errMessage;

  DeleteFromFavError(this.errMessage);
}
