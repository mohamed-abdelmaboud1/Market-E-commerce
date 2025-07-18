import 'package:marketi_ecommers/cubit/user_cubit/user_state.dart';


final class GetUserSuccess extends UserState {

}

final class GetUserLoading extends UserState{}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}
