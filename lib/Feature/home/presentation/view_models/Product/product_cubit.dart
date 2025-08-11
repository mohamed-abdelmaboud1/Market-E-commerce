import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/Product/product_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.apiConsumer) : super(ProductInitial());
  final ApiConsumer apiConsumer;

  Future<void> fetchProducts() async {
    emit(ProductLoading());

    try {
      final token = CacheHelper.getData(key: ApiKey.token);
      if (token == null) {
        emit(ProductError('No token found'));
        return;
      }
      final response = await apiConsumer.get(
        Endpoints.productUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final List data = response['list'];
      final products = data.map((item) => ProductModel.fromJson(item)).toList();

      emit(ProductLoaded(products.cast<ProductModel>()));
    } catch (e) {
      emit(ProductError('Failed to load products $e'));
      print(e);
    }
  }
}
