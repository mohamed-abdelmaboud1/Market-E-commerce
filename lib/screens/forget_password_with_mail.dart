import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/widgets/forget_pass_widget.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/colors.dart';
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/text_field_widget.dart';

class ForgetPasswordWithMail extends StatefulWidget {
  ForgetPasswordWithMail({super.key});

  @override
  State<ForgetPasswordWithMail> createState() =>
      _ForgetPasswordWithMailState();
}

class _ForgetPasswordWithMailState extends State<ForgetPasswordWithMail> {
  final TextEditingController _emailController = TextEditingController();
  String? _emailError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPassWidget(
                textBar: "Forgot Password",
                image: ImagePathes.image5,
                text:
                    "Please enter your email address to receive a verification code"),
            SizedBox(
              height: 5.h,
            ),
            //Email
            BuildLabelText(
              sizePaddding: 33,
              text: "Email",
            ),
            TextFieldWidget(
              mailPassText: 'You@gmail.com',
              icon: Icons.mail_outline,
              controller: _emailController,
              errorText: _emailError,
            ),
            SizedBox(
              height: 3.h,
            ),
            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Send Code",
              onPressed: () {
                                context.push(AppRouter.verifyCodeWithMail);

              },
            ),

            SizedBox(height: 3.h),
            
          ],
        ),
      ),
    );
  }
}
