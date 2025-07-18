import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../constant/image_pathes.dart';
import '../../../../../constant/app_router.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go(AppRouter.onBoarding1Path);
    });
  }

  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        ImagePathes.logo,
      ),
    );
  }
}
