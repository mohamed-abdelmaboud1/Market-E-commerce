import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constant/colors.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/image_pathes.dart';
import '../widgets/Social_login.dart';
import '../widgets/custom_button.dart';
import '../widgets/remember.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/text__widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _emailError;
  String? _passwordError;

  void _signIn() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
      _isLoading = true;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!_formKey.currentState!.validate()) {
      setState(() => _isLoading = false);
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 20.w,
                      height: 7.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: GoogleFonts.poppins(
                              color: PrimaryColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            Center(
              child: Image.asset(ImagePathes.logo),
            ),
            SizedBox(
              height: 3.h,
            ),
            TextFieldWidget(
              mailPassText: 'Username or Email.',
              icon: Icons.mail_outlined,
              controller: _emailController,
              errorText: _emailError,
            ),
            SizedBox(
              height: 1.h,
            ),
            TextFieldWidget(
              mailPassText: 'Password',
              icon: Icons.lock_outlined,
              controller: _passwordController,
              errorText: _passwordError,
            ),
            buildRememberMeRow(),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
                textcolor: Colors.white,
                groundColor: PrimaryColor,
                button: _isLoading ? "Loading..." : "Log In",
                onPressed: () {
                  context.push(AppRouter.registerPath);
                }

                // _isLoading ? (){} : _signIn,
                ),
            SizedBox(
              height: 1.h,
            ),
            SocialLoginButtons(),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  text: 'Are you new in Marketi',
                  color: Color(0xff51526C),
                  fontSize: 14.7.sp,
                  fontWeight: FontWeight.w400,
                ),
                GestureDetector(
                  onTap: () {
                    context.push(AppRouter.registerPath);
                  },
                  child: TextWidget(
                    text: 'register?',
                    color: PrimaryColor,
                    fontSize: 14.7.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
          ],
        ),
      ),
    );
  }
}
