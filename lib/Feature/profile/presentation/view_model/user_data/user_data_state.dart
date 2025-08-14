

import '../../../data/models/user_data_model.dart';

abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UserDataLoading extends UserDataState {}

class UserDataLoaded extends UserDataState {
final UserDataModel userData;

  UserDataLoaded(this.userData);
}

class UserDataError extends UserDataState {
  final String errMessage;

  UserDataError(this.errMessage);
}
