import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/image_widget.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

class ProductWidget extends StatefulWidget {
  ProductWidget(
      {super.key,
      this.productImage,
      this.imageMemory,
      this.price,
      required this.productName,
      this.imageHight,
      required this.imageWidth,
      this.IsOffer,
      this.isFav,
      this.isAdd,
      this.isImageMemory = false,
      this.rating = "4.9"});
  String? productImage;
  Uint8List? imageMemory;
  String? price;
  String productName;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  bool? isAdd;
  bool? isImageMemory;
  String? rating;
  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isFav = false;
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ImageWidget(
            imageWidth: widget.imageWidth,
            imageHight: widget.imageHight,
            IsOffer: widget.IsOffer,
            isFav: widget.isFav,
            isAdd: widget.isAdd,
            isImageMemory: widget.isImageMemory,
            productImage: widget.productImage,
            imageMemory: widget.imageMemory,
            nameProduct: widget.productName,
          ),
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
              if (widget.price != null) Text("${widget.rating}"),
            ],
          ),
        ),
        SizedBox(
          width: 35.w,
          child: CustomTextWidget(
            color: TextColor,
            fontSize: 2.h,
            fontWeight: FontWeight.w500,
            text: widget.productName,
            textAlign: TextAlign.start,
          ),
        ),
        if (widget.isAdd == true)
          SizedBox(
            height: 3.h,
          ),
        if (widget.isAdd == true)
          Align(
            alignment: Alignment.center,
            child: quantity == 0
                ? SizedBox(
                    width: 34.w,
                    height: 4.h,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        setState(() {
                          quantity = 1;
                        });
                      },
                      heroTag: null,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      label: const Text(
                        "Add",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 40.w,
                    height: 4.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: quantity == 1
                              ? Icon(Icons.delete, color: Colors.red, size: 18)
                              : Icon(Icons.remove,
                                  color: PrimaryColor, size: 18),
                          onPressed: () {
                            setState(() {
                              quantity--;
                            });
                          },
                        ),
                        Text(
                          "$quantity",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(Icons.add, color: PrimaryColor, size: 18),
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        if (widget.isAdd == true)
          SizedBox(
            height: 1.h,
          ),
      ],
    );
  }
}
