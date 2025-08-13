import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/image_pathes.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarWidget(
              textBar: "Product Details",
              isIcon: true,
            ),
            SizedBox(
              height: 2.h,
            ),
            Image.network(
              product.images[0].replaceAll('\\', '/') ,
              width: 90.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                ImagePathes.product2,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${product.category}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          const Icon(Icons.star,
                              color: Colors.orange, size: 16),
                          Text(" ${product.rating.toStringAsFixed(1)}",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "${product.title}",
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 1.h),
                  SizedBox(
                    width: 90.w,
                    child: Text(
                      "${product.description}",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAppBar(
          child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    "Price \$${product.price}",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                
        
                addToCartButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

addToCartButton() {
  return ElevatedButton(
    onPressed: () {},
    child: Row(
      children: [
        SizedBox(
          width: 3.w,
          height: 20.h,
        ),
        Icon(
          Icons.shopping_cart,
          color: PrimaryColor,
        ),
        SizedBox(
          width: 2.w,
        ),
        CustomTextWidget(
            color: PrimaryColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w300,
            text: "Add to Cart"),
        SizedBox(
          width: 3.w,
        ),
      ],
    ),
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      textStyle: TextStyle(fontSize: 16),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
        side: BorderSide(color: PrimaryColor, width: 1.5),
      ),
    ),
  );
}
