import 'package:dio/dio.dart';
import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:marketi_ecommers/core/errors/error_model.dart';
import 'package:marketi_ecommers/core/errors/exceptions.dart';
import 'package:marketi_ecommers/cubit/user/user_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_router.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.apiConsumer) : super(UserInitialState());
  final ApiConsumer apiConsumer;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  GlobalKey<FormState> signUpFormKey = GlobalKey();
  //Profile Pic
  // XFile? profilePic;
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpPhoneNumber = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  signIn() async {
    try {
      emit(SignInLoading());
      final response = await apiConsumer.post(Endpoints.signInUrl, data: {
        ApiKey.email: signInEmail.text.trim(),
        ApiKey.password: signInPassword.text.trim(),
      });

      final token = response[ApiKey.token];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      emit(SignInSuccess());
      print("LOGIN TOKEN: $token");
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  signUp()async{
     try {
      emit(SignUpLoading());
      final response = await apiConsumer.post(Endpoints.signUpUrl, data: {
        ApiKey.name: signUpName.text.trim(),
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.password: signUpPassword.text.trim(),
        ApiKey.confirmPassword: confirmPassword.text.trim(),
      });

      emit(SignUpSuccess(message:response[ApiKey.message] ));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.errorMessage));
    }

  }
  resetePassword()async{
     try {
      //emit(SignUpLoading());
      final response = await apiConsumer.post(Endpoints.resetPassword, data: {
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.password: signUpPassword.text.trim(),
        ApiKey.confirmPassword: confirmPassword.text.trim(),
      });

      emit(SignUpSuccess(message:response[ApiKey.message] ));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
