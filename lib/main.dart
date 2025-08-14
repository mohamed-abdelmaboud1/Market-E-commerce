import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/reset_pass_cubit.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/send_resete_password_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/Product/product_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/banners/banners_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/brand_and_categories/brand_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/brand_and_categories/category_cubit.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/user_data/user_data_cubit.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view_models/topSearch/top_search_cubit.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view_models/signIn_cubit/signIn_cubit.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view_models/signUP_cubit/signUP_cubit.dart';
import 'package:marketi_ecommers/Feature/verify/presentation/view_models/activated_reset_password_cubit.dart';
import 'package:marketi_ecommers/core/Api/dio_consumer.dart';
import 'package:sizer/sizer.dart';

import 'core/cache/cache_helper.dart';
import 'core/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<SigninCubit>(
              create: (_) => SigninCubit(DioConsumer(dio: Dio()))),
          BlocProvider<SignupCubit>(
              create: (_) => SignupCubit(DioConsumer(dio: Dio()))),
          BlocProvider<SendResetePasswordCubit>(
              create: (_) => SendResetePasswordCubit(DioConsumer(dio: Dio()))),
          BlocProvider<ActivatedResetPasswordCubit>(
              create: (_) =>
                  ActivatedResetPasswordCubit(DioConsumer(dio: Dio()))),
          BlocProvider<ResetPassCubit>(
              create: (_) => ResetPassCubit(DioConsumer(dio: Dio()))),
          BlocProvider<HomeCubit>(
            create: (_) => HomeCubit(
              bannersCubit: BannersCubit(DioConsumer(dio: Dio())),
              productsCubit: ProductCubit(DioConsumer(dio: Dio())),
              brandCubit: BrandCubit(DioConsumer(dio: Dio())),
              categoryCubit: CategoryCubit(DioConsumer(dio: Dio())),
            ),
          ),
          BlocProvider<ProductCubit>(
              create: (_) => ProductCubit(DioConsumer(dio: Dio()))),
          BlocProvider<BannersCubit>(
              create: (_) => BannersCubit(DioConsumer(dio: Dio()))),
          BlocProvider<TopSearchCubit>(
              create: (_) => TopSearchCubit(DioConsumer(dio: Dio()))),
          BlocProvider<BrandCubit>(
              create: (_) => BrandCubit(DioConsumer(dio: Dio()))),
          BlocProvider<CategoryCubit>(
              create: (_) => CategoryCubit(DioConsumer(dio: Dio()))),
          BlocProvider<UserDataCubit>(
              create: (_) => UserDataCubit(DioConsumer(dio: Dio()))),
        ],
        child: const MarketEcommers(),
      ),
    ),
  );
}

class MarketEcommers extends StatelessWidget {
  const MarketEcommers({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
