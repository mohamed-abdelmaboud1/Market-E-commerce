import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constant/colors.dart';
import '../../../../../utils/custom_text__widget.dart';

class BuildLabelText extends StatelessWidget {
  BuildLabelText({required this.sizePaddding, required this.text});
  int sizePaddding;
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: sizePaddding.h),
      child: CustomTextWidget(
        text: text,
        color: TextColor,
        fontSize: 14.7.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
