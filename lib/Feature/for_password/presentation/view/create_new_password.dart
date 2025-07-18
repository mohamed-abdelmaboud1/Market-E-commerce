import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/widgets/forget_pass_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/app_router.dart';
import '../../../../constant/colors.dart';
import '../../../../widgets/build_label_text.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/text_field_widget.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() =>
      _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ForgetPassWidget(
                textBar: "Create New Password",
                image: ImagePathes.image4,
                text:
                    "New password must be different from last password"),
            SizedBox(
              height: 5.h,
            ),
            //Phone Number
            BuildLabelText(
              sizePaddding: 26,
              text: "Phone Number",
            ),
            TextFieldWidget(
              mailPassText: 'Phone Number',
              icon: Icons.phone,
              controller: _phoneController,
            ),
             SizedBox(
              height: 2.h,
            ),

            //Confirm Password
            BuildLabelText(
              sizePaddding: 23,
              text: "Confirm Password",
            ),
            TextFieldWidget(
              mailPassText: 'Confirm Password',
              icon: Icons.lock_outlined,
              controller: _confirmPasswordController,
            ),
            SizedBox(
              height: 3.h,
            ),

            CustomButton(
              textcolor: Colors.white,
              groundColor: PrimaryColor,
              button: "Save Password",
              onPressed: () {},
            ),

            SizedBox(height: 3.h),
          ] 
        ),
      ),
    );
  }
}
