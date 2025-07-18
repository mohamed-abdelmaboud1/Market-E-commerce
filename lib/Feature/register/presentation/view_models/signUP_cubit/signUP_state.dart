import 'package:marketi_ecommers/cubit/user_cubit/user_state.dart';


final class SignUpSuccess extends UserState {
  final String message;

  SignUpSuccess({required this.message});
}


final class SignUpLoading extends UserState {}

final class SignUpFailure extends UserState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}