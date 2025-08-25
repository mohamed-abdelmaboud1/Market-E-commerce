import '../../../data/models/user_data_model.dart';

abstract class UserEditState {}

class UserEditInitial extends UserEditState {}

class UserEditLoading extends UserEditState {}

class UserEditLoaded extends UserEditState {
  final UserDataModel userData;
  UserEditLoaded(this.userData);
}

class UserEditSuccess extends UserEditState {
  final String message;
  UserEditSuccess(this.message);
}

class UserEditError extends UserEditState {
  final String errMessage;
  UserEditError(this.errMessage);
}
