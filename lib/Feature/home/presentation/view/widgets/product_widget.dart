import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget(
      {super.key,
      required this.productImage,
      this.price,
      required this.productName,
      this.imageHight,
      required this.imageWidth,
      this.IsOffer,
      this.isFav,
      this.isAdd});
  String productImage;
  String? price;
  String productName;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  bool? isAdd;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
                width: widget.imageWidth,
                height: widget.imageHight,
                child: Image.asset(widget.productImage)),
            if (widget.IsOffer == true)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3), // شفافية 30%
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "15% OFF",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            if (widget.isFav == true)
              Positioned(
                top: -2,
                right: -5,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_outline,
                    color: isFav ? Colors.red : Colors.black45,
                  ),
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h),
          child: Row(
            children: [
              if (widget.price != null)
                CustomTextWidget(
                  color: TextColor,
                  fontSize: 2.h,
                  fontWeight: FontWeight.w500,
                  text: widget.price!,
                ),
              if (widget.price != null) SizedBox(width: 10.w),
              if (widget.price != null)
                const Icon(Icons.star, color: Colors.orange, size: 16),
              if (widget.price != null) const Text("4.9"),
            ],
          ),
        ),
        SizedBox(
          width: 24.w,
          child: CustomTextWidget(
            color: TextColor,
            fontSize: 2.h,
            fontWeight: FontWeight.w500,
            text: widget.productName,
          ),
        ),
        if (widget.isAdd == true)
          SizedBox(
            height: 2.h,
          ),
        if (widget.isAdd == true)
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 30.w,
              height: 4.h,
              child: FloatingActionButton.extended(
                onPressed: () {},
                heroTag: null,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // يجعل الشكل بيضاويًا
                ),
                label: const Text(
                  "Add",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
