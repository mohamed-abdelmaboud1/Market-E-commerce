import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view_models/add_to_fav/add_to_fav_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../../core/Api/endpoints.dart';

class AddToFavCubit extends Cubit<AddToFavState> {
  AddToFavCubit(this.apiConsumer) : super(AddToFavInitial());
  final ApiConsumer apiConsumer;

  Future<void> addToProductCart(String productId) async {
    emit(AddToFavLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(AddToFavError('No token found'));
        return;
      }

      final response = await apiConsumer.post(
        Endpoints.addToFavUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "productId": productId,
        },
      );
      emit(AddToFavLoaded(response.data));
    } catch (e) {
      emit(AddToFavError("Error adding to cart: $e"));
    }
  }
}
