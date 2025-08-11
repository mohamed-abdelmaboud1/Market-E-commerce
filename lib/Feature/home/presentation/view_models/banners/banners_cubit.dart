import 'dart:typed_data';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_state.dart';
import 'package:marketi_ecommers/core/Api/api_consumer.dart';
import 'package:marketi_ecommers/core/cache/cache_helper.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../data/models/banners_model.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit(this.apiConsumer) : super(BannersInitial());
  final ApiConsumer apiConsumer;

  Future<Uint8List?> fetchImageBytesWithDio(String imagePath) async {
    final dio = Dio();
    final token = CacheHelper.getData(key: 'token');

    try {
      final response = await dio.get<List<int>>(
        "${Endpoints.baseUrlForImage}${imagePath.replaceAll('\\', '/')}",
        options: Options(
          responseType: ResponseType.bytes,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print("${Endpoints.baseUrlForImage}${imagePath.replaceAll('\\', '/')}");

      return Uint8List.fromList(response.data!);
    } catch (e) {
      print("Error loading image: $e");
      return null;
    }
  }

  Future<void> fetchProducts() async {
    emit(BannersLoading());

    try {
      final token = CacheHelper.getData(key: 'token');
      if (token == null) {
        emit(BannersError('No token found'));
        return;
      }

      final response = await apiConsumer.get(
        Endpoints.bannerssUrl,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      final bannersModel = BannersModel.fromJson(response);
      emit(BannersLoaded(bannersModel.bannerList));
    } catch (e) {
      emit(BannersError('Failed to load banners'));
    }
  }
}
