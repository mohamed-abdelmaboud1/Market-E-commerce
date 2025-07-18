import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/home_view.dart';
import 'package:marketi_ecommers/Feature/login/presentation/view/login_view.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view/register_view.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/Search_Not_Found_Page.dart';
import 'package:marketi_ecommers/Feature/success_order/presentation/view/Success_Order_Page.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/cart_empty.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/forget_password_with_mail.dart';
import 'package:marketi_ecommers/Feature/for_password/presentation/view/forget_password_with_phone.dart';
import 'package:marketi_ecommers/Feature/verify/presentation/view/verify_code_with_mail.dart';
import '../../Feature/for_password/presentation/view/confirmation_new_pass .dart';
import '../../Feature/for_password/presentation/view/congratulation_reset_pass.dart';
import '../../Feature/splash/presentation/view/on_boarding1.dart';
import '../../Feature/splash/presentation/view/on_boarding2.dart';
import '../../Feature/splash/presentation/view/on_boarding3.dart';
import '../../Feature/splash/presentation/view/splash_view.dart';
import '../../Feature/verify/presentation/view/verify_code_with_phone.dart';

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
    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashView(),
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
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerPath,
        builder: (context, state) => const RegisterView(),
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
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
