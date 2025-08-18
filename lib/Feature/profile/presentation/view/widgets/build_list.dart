import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

Widget buildListTile({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
  Color? color,
}) {
  return ListTile(
    leading: Icon(
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
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: onTap,
  );
}
