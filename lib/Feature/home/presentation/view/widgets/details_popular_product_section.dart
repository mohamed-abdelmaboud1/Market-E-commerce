
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:marketi_ecommers/constant/image_pathes.dart';
import 'package:sizer/sizer.dart';

class DetailsPopularProductSection extends StatelessWidget {
  const DetailsPopularProductSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductWidget(
              imageWidth: 40.w,
              imageHight: 120,
              productImage: ImagePathes.product1,
              price: "499 LE",
              productName: "Smart Watch",
              IsOffer: true,
              isFav: true,
            ),
            ProductWidget(
              imageWidth: 40.w,
              imageHight: 120,
              productImage: ImagePathes.product2,
              price: "19999 LE",
              productName: "iPhone 11 Pro",
              isFav: true,
            ),
          ],
        ),
      ),
    );
  }
}