import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/screens/Search_Not_Found_Page.dart';
import 'package:marketi_ecommers/screens/Success_Order_Page.dart';
import 'package:marketi_ecommers/screens/cart_empty.dart';
import 'package:marketi_ecommers/screens/forget_password_with_mail.dart';
import 'package:marketi_ecommers/screens/forget_password_with_phone.dart';
import 'package:marketi_ecommers/screens/home_screen.dart';
import 'package:marketi_ecommers/screens/verify_code_with_mail.dart';

import '../screens/confirmation_new_pass .dart';
import '../screens/congratulation_reset_pass.dart';
import '../screens/login_screen.dart';
import '../screens/on_boarding1.dart';
import '../screens/on_boarding2.dart';
import '../screens/on_boarding3.dart';
import '../screens/register_screen.dart';
import '../screens/splash.dart';
import '../screens/verify_code_with_phone.dart';

class AppRouter {
  static String splashPath = '/';
  static String onBoarding1Path = '/onBoarding1Path';
  static String onBoarding2Path = '/onBoarding2Path';
  static String onBoarding3Path = '/onBoarding3Path';
  static String loginPath = '/loginPath';
  static String registerPath = '/registerPath';
  static String forgetPasswordWithPhone = '/forgetPasswordWithPhone';
  static String forgetPasswordWithMail = '/forgetPasswordWithMail';
  static String verifyCodeWithPhone = '/verifyCodeWithPhone';
  static String verifyCodeWithMail = '/verifyCodeWithMail';
  static String confirmationNewPass = '/confirmationNewPass';
  static String congratulationResetPass = '/congratulationResetPass';
  static String searchNotFoundPage = '/searchNotFoundPage';
  static String successOrderPage = '/successOrderPage';
  static String cartEmpty = '/cartEmpty';
  static String homePath = '/homePath';
  static GoRouter router = GoRouter(
    initialLocation: '/loginPath',
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const Splash(),
      ),
      GoRoute(
        path: onBoarding1Path,
        builder: (context, state) => const OnBoarding1(),
      ),
      GoRoute(
        path: onBoarding2Path,
        builder: (context, state) => const OnBoarding2(),
      ),
      GoRoute(
        path: onBoarding3Path,
        builder: (context, state) => const OnBoarding3(),
      ),
      GoRoute(
        path: loginPath,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: registerPath,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: forgetPasswordWithPhone,
        builder: (context, state) => ForgetPasswordWithPhone(),
      ),
      GoRoute(
        path: forgetPasswordWithMail,
        builder: (context, state) => ForgetPasswordWithMail(),
      ),
      GoRoute(
        path: verifyCodeWithPhone,
        builder: (context, state) => VerifyCodeWithPhone(),
      ),
      GoRoute(
        path: verifyCodeWithMail,
        builder: (context, state) => VerifyCodeWithMail(),
      ),
      GoRoute(
        path: confirmationNewPass,
        builder: (context, state) => const ConfirmationNewPass(),
      ),
       GoRoute(
        path: congratulationResetPass,
        builder: (context, state) => const CongratulationResetPass(),
      ),
      GoRoute(
        path: successOrderPage,
        builder: (context, state) => SuccessOrderPage(),
      ),
      GoRoute(
        path: cartEmpty,
        builder: (context, state) => CartEmpty(),
      ),
      GoRoute(
        path: searchNotFoundPage,
        builder: (context, state) => const SearchNotFoundPage(),
      ),
      GoRoute(
        path: homePath,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
