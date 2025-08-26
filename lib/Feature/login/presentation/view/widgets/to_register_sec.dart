
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';

class ToRegisterSection extends StatelessWidget {
  const ToRegisterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          text: 'Are you new in Marketi',
          color: const Color(0xff51526C),
          fontSize: 14.7.sp,
          fontWeight: FontWeight.w400,
        ),
        GestureDetector(
          onTap: () {
            context.push(AppRouter.registerPath);
          },
          child: CustomTextWidget(
            text: ' register?',
            isThemeColor: false,
            color: PrimaryColor,
            fontSize: 14.7.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
