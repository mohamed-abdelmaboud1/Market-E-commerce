import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/Product/product_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/home_cubit/home_state.dart';

import '../brand_and_categories/brand_cubit.dart';
import '../brand_and_categories/category_cubit.dart';

class HomeCubit extends Cubit<HomeState> {
  final BannersCubit bannersCubit;
  final ProductCubit productsCubit;
  final BrandCubit brandCubit;
  final CategoryCubit categoryCubit;


  HomeCubit({
    required this.bannersCubit,
    required this.productsCubit,
    required this.brandCubit,
    required this.categoryCubit,
  }) : super(HomeInitial());

  Future<void> fetchHomeData() async {
    emit(HomeLoading());

    try {
      await Future.wait([
        bannersCubit.fetchProducts(),
        productsCubit.fetchProducts(),
        brandCubit.fetchProducts(),
        categoryCubit.fetchProducts(),
      ]);

      emit(HomeLoaded());
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}

