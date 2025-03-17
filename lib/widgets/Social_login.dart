import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constant/colors.dart';
import 'text__widget.dart';

Widget SocialLoginButtons() {
  return Column(
    children: [
      TextWidget(
        text: 'Or Continue With',
        color: const Color(0xFF51526C),
        fontSize: 14.7.sp,
        fontWeight: FontWeight.w400,
      ),
      SizedBox(height: 5.h),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(
                color: BorderColor,
                width: 2,
              ),
            ),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.google, size: 10.w, color: TextColor),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 7.w),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(
                color: BorderColor,
                width: 2,
              ),
            ),
            child: IconButton(
              icon: Icon(FontAwesomeIcons.apple, size: 10.w, color: TextColor),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 7.w),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white,
              border: Border.all(
                color: BorderColor,
                width: 2,
              ),
            ),
            child: IconButton(
              icon:
                  Icon(FontAwesomeIcons.facebook, size: 10.w, color: TextColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
    ],
  );
}
