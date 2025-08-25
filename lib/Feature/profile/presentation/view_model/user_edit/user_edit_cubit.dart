import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'user_edit_state.dart';
import '../../../../../core/Api/api_consumer.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/user_data_model.dart';

class UserEditCubit extends Cubit<UserEditState> {
  final ApiConsumer apiConsumer;

  UserEditCubit(this.apiConsumer) : super(UserEditInitial());

  Future<void> loadUserData() async {
    try {
      emit(UserEditLoading());
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(UserEditError("No token found"));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.userDataUrl,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      final userData = UserDataModel.fromJson(response['message']);
      emit(UserEditLoaded(userData));
    } catch (e) {
      emit(UserEditError("Failed to load user data: $e"));
    }
  }

  Future<void> editUserData(UserDataModel userData) async {
    try {
      emit(UserEditLoading());
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(UserEditError("No token found"));
        return;
      }

      final response = await apiConsumer.post(
        Endpoints.userEditUrl,
        data: userData.toJson(),
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      emit(UserEditSuccess("Profile updated successfully"));
      await loadUserData();
    } catch (e) {
      emit(UserEditError("Failed to update user data: $e"));
    }
  }
}
