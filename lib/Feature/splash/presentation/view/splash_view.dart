import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/splash/presentation/view/widgets/splash.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:SplashBody(),
      
      );
  }
}