import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/delete_from_cart/delete_from_cart_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../../core/Api/endpoints.dart';

class DeleteFromCartCubit extends Cubit<DeleteFromCartState> {
  DeleteFromCartCubit(this.apiConsumer) : super(DeleteFromCartInitial());
  final ApiConsumer apiConsumer;

  Future<void> deleteProductCart(String productId) async {
    emit(DeleteFromCartLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(DeleteFromCartError('No token found'));
        return;
      }

      final response = await apiConsumer.delete(
        Endpoints.deleteFromCartUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        data: {
          "productId": productId,
        },

      );
      emit(DeleteFromCartLoaded(response.data));
    } catch (e) {
      emit(DeleteFromCartError("Error  to delete from cart: $e"));
    }
  }
}
