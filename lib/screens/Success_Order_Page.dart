import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:marketi_ecommers/widgets/bar_widget.dart';
import 'package:marketi_ecommers/widgets/forget_pass_widget.dart';
import 'package:marketi_ecommers/widgets/four_orgnaized_widget.dart';
import 'package:sizer/sizer.dart';

import '../constant/app_router.dart';
import '../constant/colors.dart';
import '../widgets/build_label_text.dart';
import '../widgets/custom_button.dart';
import '../widgets/text__widget.dart';
import '../widgets/text_field_widget.dart';

class SuccessOrderPage extends StatefulWidget {
  SuccessOrderPage({super.key});

  @override
  State<SuccessOrderPage> createState() => _SuccessOrderPageState();
}

class _SuccessOrderPageState extends State<SuccessOrderPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarWidget(textBar: "Checkout",),
            FourOrgnaizedWidget(
              image: Image.asset(
                ImagePathes.image11,
                width: 200.w,
                height: 30.h,
              ),
              textBold: "Thank You!",
              textNormal:
                  "Woah, You Have sucessfully orderd",
              textButton: "Go Home",
            ),
          ],
        ),
      ),
    );
  }
}
