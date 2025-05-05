import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart' show AppRouter;
import '../constant/colors.dart';
import '../constant/image_pathes.dart';
import '../cubit/user/user_cubit.dart';
import '../cubit/user/user_state.dart'
    show UserState, resetPassLoading, resetPassSuccess, restPassFailure;
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/text__widget.dart';
import '../widgets/text_field_widget.dart';

class ConfirmationNewPass extends StatefulWidget {
  const ConfirmationNewPass({super.key});

  @override
  State<ConfirmationNewPass> createState() => _ConfirmationNewPassState();
}

class _ConfirmationNewPassState extends State<ConfirmationNewPass> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, State) {
        if (State is resetPassSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Center(child: Text(State.message)),
            ),
          );
        } else if (State is restPassFailure) {
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.w, left: 3.h),
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
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Center(
                    child: Image.asset(
                      ImagePathes.image9,
                      width: 200.w,
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Congratulations",
                  style: GoogleFonts.poppins(
                    color: TextColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 95.w,
                  child: TextWidget(
                    text: "Please Enter Your new Password",
                    textAlign: TextAlign.center,
                    color: const Color(0xff51526C),
                    fontSize: 15.7.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 3.h,
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

                
                TextFieldWidget(
                  mailPassText: 'Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.signUpPassword,
                  errorText: null,
                ),
                SizedBox(
                  height: 1.h,
                ),

                
                TextFieldWidget(
                  mailPassText: 'Confirm Password',
                  icon: Icons.lock_outlined,
                  controller: cubit.confirmPassword,
                ),
                SizedBox(
                  height: 3.h,
                ),
                State is resetPassLoading
                    ? CircularProgressIndicator(
                        color: PrimaryColor,
                      )
                    : CustomButton(
                        textcolor: Colors.white,
                        groundColor: PrimaryColor,
                        button: "Done",
                         onPressed: () async {
                          await cubit.resetePassword();
                          if (!mounted) return;
                          context.push(AppRouter.congratulationResetPass);
                        },
                        
                        ),
              ],
            ),
          ),
        );
      },
    );
  }
}
