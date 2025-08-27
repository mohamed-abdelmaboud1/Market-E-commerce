import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/core/widgets/bottom_navigation.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_button.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

import '../routing/app_router.dart';
import '../utils/colors.dart';

class FourOrgnaizedWidget extends StatelessWidget {
  FourOrgnaizedWidget(
      {super.key,
      required this.image,
      required this.textBold,
      required this.textNormal,
      required this.textButton});

  Image image;
  String textBold;
  String textNormal;
  String textButton;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Center(child: image),
        ),
        SizedBox(
          height: 3.h,
        ),
        Text(
          textAlign: TextAlign.center,
          textBold,
          style: GoogleFonts.poppins(
            color: Theme.of(context).brightness == Brightness.light
                ? TextColor
                : const Color.fromARGB(255, 169, 190, 239),
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        SizedBox(
          width: 75.w,
          child: CustomTextWidget(
            text: textNormal,
            textAlign: TextAlign.center,
            color: const Color(0xff51526C),
            fontSize: 15.7.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        CustomButton(
            textcolor: Colors.white,
            groundColor: PrimaryColor,
            button: textButton,
            onPressed: () {
              context.read<BottomNavCubit>().changeSelectedIndex(0, context);
              context.push(AppRouter.homePath);
            }),
      ],
    );
  }
}
