import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/cubit/user/user_cubit.dart';
import 'package:marketi_ecommers/cubit/user/user_state.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/colors.dart';
import '../constant/image_pathes.dart';
import '../widgets/Social_login.dart';
import '../widgets/custom_button.dart';
import '../widgets/remember.dart';
import '../widgets/text__widget.dart';
import '../widgets/text_field_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, State) {
        if (State is SignInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text("Success")),
            ),
          );
        } else if (State is SignInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(State.errMessage),
            ),
          );
        }
      },
      builder: (context, State) {
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
                  controller: cubit.signInEmail,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),
                TextFieldWidget(
                  mailPassText: 'Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.signInPassword,
                  errorText: null,
                ),
                const buildRememberMeRow(),
                SizedBox(
                  height: 2.h,
                ),
                State is SignInLoading
                    ? CircularProgressIndicator(
                        color: PrimaryColor,
                      )
                    : CustomButton(
                        textcolor: Colors.white,
                        groundColor: PrimaryColor,
                        button: "Log In",
                        onPressed: () async {
                          await cubit.signIn();
                          context.push(AppRouter.homePath);
                        },
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
                      color: const Color(0xff51526C),
                      fontSize: 14.7.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.push(AppRouter.registerPath);
                      },
                      child: TextWidget(
                        text: ' register?',
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
      },
    );
  }
}
