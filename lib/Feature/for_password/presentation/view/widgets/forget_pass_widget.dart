import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../../../../constant/colors.dart';
import '../../../../../constant/image_pathes.dart';
import '../../../../register/presentation/view/widgets/build_label_text.dart';
import '../../../../../utils/text_field_widget.dart';
import '../../../../../utils/custom_text__widget.dart';

class ForgetPassWidget extends StatelessWidget {
  ForgetPassWidget(
      {super.key,
      required this.textBar,
      required this.image,
      required this.text});
  String textBar;
  String text;
  String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.w, left: 3.h),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: BorderColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_left_outlined,
                      size: 5.h,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w, top: 4.5.h),
              child: CustomTextWidget(
                text: '$textBar',
                color: Color(0xff51526C),
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Center(
            child: Image.asset(
              image,
              width: 80.w,
              height: 25.h,
            ),
          ),
        ),
        SizedBox(height: 3.h),
        Center(
          child: SizedBox(
            width: 80.w,
            child: CustomTextWidget(
              textAlign: TextAlign.center,
              text: '$text',
              color: Color(0xff51526C),
              fontSize: 16.7.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
