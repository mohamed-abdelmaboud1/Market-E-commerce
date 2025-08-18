import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/core/custom_text__widget.dart';

Widget switchListTile({
  required IconData icon,
  required String text,
  required ValueChanged<bool> onChanged,
  required bool value,
  Color? color,
}) {
  return SwitchListTile(
    secondary: Icon(
      icon,
      color: color ?? Colors.black87,
      size: 25,
    ),
    title: CustomTextWidget(
      color: color ?? Colors.black,
      fontSize: 17.sp,
      text: text,
      maxLines: 1,
      textAlign: TextAlign.start,
    ),
    value: value,
    onChanged: onChanged,
  );
}
