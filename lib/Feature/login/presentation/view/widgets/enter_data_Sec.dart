
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/core/text_field_widget.dart';
import '../../view_models/signIn_cubit/signIn_cubit.dart';

class EnterDataSection extends StatelessWidget {
  const EnterDataSection({
    super.key,
    required this.cubit,
  });

  final SigninCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
