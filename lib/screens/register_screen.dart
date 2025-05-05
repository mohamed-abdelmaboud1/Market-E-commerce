import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/cubit/user/user_cubit.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/colors.dart';
import '../constant/image_pathes.dart';
import '../cubit/user/user_state.dart';
import '../widgets/Social_login.dart';
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_field_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, State) {
        if (State is SignUpSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text("Success, Please Verifyed Your Email")),
            ),
          );
        } else if (State is SignUpFailure) {
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
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.h),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.w),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: BorderColor,
                                width: 2,
                              ),
                            ),
                            child: Center(
                                child: IconButton(
                              icon: Icon(
                                Icons.arrow_left_outlined,
                                size: 5.h,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Center(
                        child: Image.asset(
                          ImagePathes.logo,
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
                ),

                //Your Name
                BuildLabelText(
                  sizePaddding: 30,
                  text: "Your Name",
                ),
                TextFieldWidget(
                  mailPassText: 'Full Name',
                  icon: Icons.edit,
                  controller: cubit.signUpName,
                ),
                SizedBox(
                  height: 1.h,
                ),

                //Username
                BuildLabelText(
                  sizePaddding: 30,
                  text: "Username",
                ),
                TextFieldWidget(
                  mailPassText: 'Username',
                  icon: Icons.person,
                  controller: cubit.signUpName,
                ),
                SizedBox(
                  height: 1.h,
                ),

                //Phone Number
                BuildLabelText(
                  sizePaddding: 26,
                  text: "Phone Number",
                ),
                TextFieldWidget(
                  mailPassText: 'Phone Number',
                  icon: Icons.phone,
                  controller: cubit.signUpPhoneNumber,
                ),
                SizedBox(
                  height: 1.h,
                ),

                //Email
                BuildLabelText(
                  sizePaddding: 33,
                  text: "Email",
                ),
                TextFieldWidget(
                  mailPassText: 'You@gmail.com',
                  icon: Icons.mail_outline,
                  controller: cubit.signUpEmail,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),

                //Password
                BuildLabelText(
                  sizePaddding: 30,
                  text: "Password",
                ),
                TextFieldWidget(
                  mailPassText: 'Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.signUpPassword,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),

                //Confirm Password
                BuildLabelText(
                  sizePaddding: 23,
                  text: "Confirm Password",
                ),
                TextFieldWidget(
                  mailPassText: 'Confirm Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.confirmPassword,
                ),
                SizedBox(
                  height: 2.h,
                ),
                State is SignUpLoading
                    ? CircularProgressIndicator(
                        color: PrimaryColor,
                      )
                    : CustomButton(
                        textcolor: Colors.white,
                        groundColor: PrimaryColor,
                        button: "Sign Up",
                      onPressed: () async {
                          await cubit.signUp();
                          context.push(AppRouter.homePath);
                        },
                      ),
                SizedBox(
                  height: 1.h,
                ),
                SocialLoginButtons(),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
