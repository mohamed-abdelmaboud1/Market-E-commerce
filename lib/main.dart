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
import 'Feature/cart/presentation/view_models/add_to_cart/add_to_cart_cubit.dart';
import 'core/cache/cache_helper.dart';
import 'core/routing/app_router.dart';
import 'core/services/bloc_provider_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  final dioConsumer = DioConsumer(dio: Dio());
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: buildBlocProviders(dioConsumer),
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
