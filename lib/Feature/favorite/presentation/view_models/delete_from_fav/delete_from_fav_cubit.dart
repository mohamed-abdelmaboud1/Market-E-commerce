import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view_models/delete_from_fav/delete_from_fav_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../../core/Api/endpoints.dart';

class DeleteFromFavCubit extends Cubit<DeleteFromFavState> {
  DeleteFromFavCubit(this.apiConsumer) : super(DeleteFromFavInitial());
  final ApiConsumer apiConsumer;

  Future<void> deleteProductCart(String productId) async {
    emit(DeleteFromFavLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(DeleteFromFavError('No token found'));
        return;
      }

      final response = await apiConsumer.delete(
        Endpoints.deleteFromFavUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "productId": productId,
        },

      );
      emit(DeleteFromFavLoaded(response.data));
    } catch (e) {
      emit(DeleteFromFavError("Error  to delete from cart: $e"));
    }
  }
}
