import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:marketi_ecommers/core/widgets/four_orgnaized_widget.dart';
import 'package:sizer/sizer.dart';


class CartEmpty extends StatefulWidget {
  CartEmpty({super.key});

  @override
  State<CartEmpty> createState() => _CartEmptyState();
}

class _CartEmptyState extends State<CartEmpty> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BarWidget(textBar: "Cart",),
            FourOrgnaizedWidget(
              image: Image.asset(
                ImagePathes.image10,
                width: 200.w,
                height: 30.h,
              ),
              textBold: "Your Cart is Empty",
              textNormal:
                  "Check our big offers, fresh products and fill your cart with items",
              textButton: "Start Shopping",
            ),
          ],
        ),
      ),
    );
  }
}
