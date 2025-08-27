
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/core/custom_text__widget.dart';

Widget buildRow(String label, String value,
    {bool isBold = false, Color? color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomTextWidget(
          color: Colors.black,
          fontSize: 17.sp,
          text: label,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
      CustomTextWidget(
        color: color ?? Colors.black,
        fontSize: 17.sp,
        text: value,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    ],
  );
}