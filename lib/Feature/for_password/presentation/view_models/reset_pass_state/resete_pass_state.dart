import '../../../../../cubit/user_cubit/user_state.dart';

final class resetPassSuccess extends UserState {
    final String message;

  resetPassSuccess({required this.message});

}

final class resetPassLoading extends UserState {}

final class restPassFailure extends UserState {
  final String errMessage;

  restPassFailure({required this.errMessage});

}