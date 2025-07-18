import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view_models/signIn_cubit/signIn_state.dart';
import 'package:marketi_ecommers/cache/cache_helper.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/Api/endpoints.dart';
import 'package:marketi_ecommers/core/errors/exceptions.dart';
import '../../../../../cubit/user_cubit/user_state.dart';
import '../../../data/models/signin_model.dart';

class SigninCubit extends Cubit<UserState> {
  SigninCubit(this.apiConsumer) : super(UserInitialState());
  final ApiConsumer apiConsumer;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  TextEditingController signInEmail = TextEditingController();
  TextEditingController signInPassword = TextEditingController();
  
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
      emit(SignInSuccess());
    } on ServerException catch (e) {
      emit(SignInFailure(errMessage: e.errorModel.errorMessage));
    }
  }
}
