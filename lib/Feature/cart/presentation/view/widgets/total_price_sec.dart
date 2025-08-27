
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/cart_view_body.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/core/custom_text__widget.dart';

class TotalPriceSec extends StatelessWidget {
  const TotalPriceSec({
    super.key,
    required this.widget,
  });

  final CartViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            text: "Total Price",
            fontSize: 16.sp,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: CustomTextWidget(
              text:
                  "EGP ${widget.products.fold(0, (total, item) => total + (item.price))}",
              fontSize: 16.sp,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
