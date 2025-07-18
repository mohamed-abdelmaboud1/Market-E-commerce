

import 'package:flutter/material.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/utils/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

class BarHomeSection extends StatelessWidget {
  const BarHomeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.h, top: 9.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 2.9.h,
            backgroundColor: Colors.blue,
            child: CircleAvatar(
              radius: 2.5.h,
              backgroundColor: Colors.white,
              child: ClipOval(
                child:
                    Image.asset(ImagePathes.profile, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            width: 2.h,
          ),
          CustomTextWidget(
            text: "Hi, Dina !",
            fontSize: 3.h,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          SizedBox(
            width: 15.h,
          ),
          const Icon(
            Icons.notifications,
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
