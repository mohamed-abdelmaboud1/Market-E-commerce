import 'package:dio/dio.dart';
import 'package:marketi_ecommers/Feature/home/data/models/banners_model.dart';

import '../../../../core/Api/api_consumer.dart';
import '../../../../core/Api/endpoints.dart';

class HomeRemoteDataSource {
  final ApiConsumer api;

  HomeRemoteDataSource(this.api);

  Future<BannersModel> fetchBanners(String token) async {
    final res = await api.get(
      Endpoints.bannerssUrl,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
    return BannersModel.fromJson(res);
  }


}
