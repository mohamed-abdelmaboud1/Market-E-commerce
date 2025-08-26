
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/register/presentation/view/widgets/build_label_text.dart';
import 'package:marketi_ecommers/core/widgets/core/text_field_widget.dart';
import 'package:sizer/sizer.dart';

import '../../view_models/signUP_cubit/signUP_cubit.dart';

class EnterRegisterDataSection extends StatelessWidget {
  const EnterRegisterDataSection({
    super.key,
    required this.cubit,
  });

  final SignupCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
