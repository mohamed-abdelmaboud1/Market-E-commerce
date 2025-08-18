import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

import '../utils/colors.dart';

class BarWidget extends StatelessWidget {
  BarWidget({super.key, this.textBar, this.isIcon = false});
  String? textBar;
  bool? isIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.w, left: 3.w),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
                border: Border.all(
                  color: BorderColor,
                  width: 1,
                ),
              ),
              child: Center(
                  child: IconButton(
                icon: Icon(
                  Icons.arrow_left_outlined,
                  size: 5.h,
                ),
                onPressed: () {
                  context.go(AppRouter.homePath);
                },
              )),
            ),
          ),
        ),
        if (textBar != null)
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: CustomTextWidget(
                color: TextColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                text: textBar!),
          )
        else
          SizedBox(
            width: 5.w,
          ),
        Padding(
          padding: EdgeInsets.only(top: 5.h, right: 4.w),
          child: isIcon == true
              ? Icon(
                  Icons.shopping_cart,
                  size: 3.5.h,
                  color: PrimaryColor,
                )
              : GestureDetector(
                  onTap: () {
                    context.go(AppRouter.profilePath);
                  },
                  child: CircleAvatar(
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
                ),
        ),
      ],
    );
  }
}
