import 'package:flutter/material.dart'
    show FormState, GlobalKey, TextEditingController;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi_ecommers/cache/cache_helper.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:marketi_ecommers/core/errors/exceptions.dart';
import 'package:marketi_ecommers/cubit/user/user_state.dart';
import 'package:marketi_ecommers/models/signIn_model.dart';
import 'package:marketi_ecommers/models/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  TextEditingController codeConfirm = TextEditingController();

  SigninModel? user;
  signIn() async {
    try {
      emit(SignInLoading());
      final response = await apiConsumer.post(Endpoints.signInUrl, data: {
        ApiKey.email: signInEmail.text.trim(),
        ApiKey.password: signInPassword.text.trim(),
      });
      user = SigninModel.fromJson(response);
      final decodedToken = JwtDecoder.decode(user!.token);
      print(decodedToken['id']);
      CacheHelper.saveData(key: ApiKey.token, value: user!.token);
      CacheHelper.saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

 
      // final token = response[ApiKey.token];
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString('token', token);

      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  signUp() async {
    try {
      emit(SignUpLoading());
      final response = await apiConsumer.post(Endpoints.signUpUrl, data: {
        ApiKey.name: signUpName.text.trim(),
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.password: signUpPassword.text.trim(),
        ApiKey.confirmPassword: confirmPassword.text.trim(),
      });
      final signupModel = SignUpModel.fromjson(response);
      emit(SignUpSuccess(message: signupModel.message));
    } on ServerException catch (e) {
      emit(SignUpFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  SendResetePassword() async {
    try {
      emit(resetPassLoading());
      final response = await apiConsumer.post(Endpoints.sendPassEmail, data: {
        ApiKey.email: signUpEmail.text.trim(),
      });

      emit(resetPassSuccess(message: response[ApiKey.message]));
    } on ServerException catch (e) {
      emit(restPassFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  activatedResetePassword() async {
    try {
      emit(resetPassLoading());
      final response = await apiConsumer.post(Endpoints.activeResetPass, data: {
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.code: codeConfirm.text.trim(),
      });

      emit(resetPassSuccess(message: response[ApiKey.message]));
    } on ServerException catch (e) {
      emit(restPassFailure(errMessage: e.errorModel.errorMessage));
    }
  }

  resetePassword() async {
    try {
      emit(resetPassLoading());
      final response = await apiConsumer.post(Endpoints.resetPassword, data: {
        ApiKey.email: signUpEmail.text.trim(),
        ApiKey.password: signUpPassword.text.trim(),
        ApiKey.confirmPassword: confirmPassword.text.trim(),
      });

      emit(resetPassSuccess(message: response[ApiKey.message]));
    } on ServerException catch (e) {
      emit(restPassFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
