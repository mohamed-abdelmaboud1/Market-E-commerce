import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/register/data/models/signup_model.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view_models/signUP_cubit/signUP_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:marketi_ecommers/core/errors/exceptions.dart';

import '../../../../../cubit/user_cubit/user_state.dart';
import '../../../../login/presentation/view_models/signIn_cubit/signIn_state.dart';

class SignupCubit extends Cubit<UserState> {
  SignupCubit(this.apiConsumer) : super(UserInitialState());
  final ApiConsumer apiConsumer;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await apiConsumer.post(Endpoints.signUpUrl, data: {
        ApiKey.name: signUpName.text.trim(),
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.password: signUpPassword.text.trim(),
        ApiKey.confirmPassword: confirmPassword.text.trim(),
      });
      final signupModel = SignUpModel.fromJson(response);
      emit(SignUpSuccess(message: signupModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
