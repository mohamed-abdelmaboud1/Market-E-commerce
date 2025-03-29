import 'package:flutter/material.dart';
import 'package:marketi_ecommers/constant/colors.dart';
import 'package:marketi_ecommers/widgets/text__widget.dart';
import 'package:sizer/sizer.dart';

class CategoryViewWidget extends StatelessWidget {
  CategoryViewWidget({super.key, required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
              color: TextColor,
              fontSize: 5.w,
              fontWeight: FontWeight.w600,
              text: text),
          InkWell(
            onTap: () {},
            child: TextWidget(
                color: const Color(0xff3F80FF),
                fontSize: 5.w,
                fontWeight: FontWeight.w500,
                text: "View all"),
          ),
        ],
      ),
    );
  }
}
