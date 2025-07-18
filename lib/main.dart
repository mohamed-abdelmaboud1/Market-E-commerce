import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/reset_pass_cubit.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view_models/send_resete_password_cubit.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view_models/signIn_cubit/signIn_cubit.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view_models/signUP_cubit/signUP_cubit.dart';
import 'package:marketi_ecommers/Feature/verify/presentation/view_models/activated_reset_password_cubit.dart';
import 'package:marketi_ecommers/core/Api/dio_consumer.dart';
import 'package:sizer/sizer.dart';

import 'cache/cache_helper.dart';
import 'constant/app_router.dart';


void main()async {
   WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider<SigninCubit>(create: (_) => SigninCubit(DioConsumer(dio: Dio()))),
          BlocProvider<SignupCubit>(create: (_) => SignupCubit(DioConsumer(dio: Dio()))),
          BlocProvider<SendResetePasswordCubit>(create: (_) => SendResetePasswordCubit(DioConsumer(dio: Dio()))),
          BlocProvider<ActivatedResetPasswordCubit>(create: (_) => ActivatedResetPasswordCubit(DioConsumer(dio: Dio()))),
          BlocProvider<ResetPassCubit>(create: (_) => ResetPassCubit(DioConsumer(dio: Dio()))),
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
