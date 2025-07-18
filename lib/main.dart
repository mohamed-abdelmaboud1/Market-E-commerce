import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/core/Api/dio_consumer.dart';
import 'package:sizer/sizer.dart';

import 'cache/cache_helper.dart';
import 'constant/app_router.dart';
import 'Feature/login/presentation/view_models/user_cubit/user_cubit.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<UserCubit>(create: (_) => UserCubit(DioConsumer(dio: Dio()))),
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
