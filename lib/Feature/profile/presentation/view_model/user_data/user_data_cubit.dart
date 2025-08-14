import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_state.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/user_data/user_data_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/user_data_model.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this.apiConsumer) : super(UserDataInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchUserData() async {
    emit(UserDataLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(UserDataError('No token found'));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.userDataUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final dataModel = UserDataResponse.fromJson(response);
      emit(UserDataLoaded(dataModel.message));
    } catch (e) {
      emit(UserDataError('Failed to load user data: $e'));
    }
  }
}
