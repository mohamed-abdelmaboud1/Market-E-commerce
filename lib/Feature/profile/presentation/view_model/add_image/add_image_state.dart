import '../../../data/models/user_data_model.dart';

abstract class AddImageState {}

class AddImageInitial extends AddImageState {}

class AddImageLoading extends AddImageState {}

class AddImageLoaded extends AddImageState {
  final UserDataModel userData;
  AddImageLoaded(this.userData);
}

class AddImageSuccess extends AddImageState {
  final String message;
  AddImageSuccess(this.message);
}

class AddImageError extends AddImageState {
  final String errMessage;
  AddImageError(this.errMessage);
}
