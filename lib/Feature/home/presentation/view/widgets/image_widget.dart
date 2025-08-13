
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/category_image.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget(
      {super.key,
      this.productImage,
      this.imageMemory,
      this.imageHight,
      required this.imageWidth,
      this.IsOffer,
      this.isFav,
      this.isAdd,
      this.isImageMemory = false,
    required  this.nameProduct 
      });
  String? productImage;
  Uint8List? imageMemory;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  bool? isAdd;
  bool? isImageMemory;
  String nameProduct;

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widget.imageWidth,
          height: widget.imageHight,
          child: widget.isImageMemory == true
              ? (widget.imageMemory != null && widget.imageMemory!.isNotEmpty
                  ? Image.memory(widget.imageMemory!)
                  : Center(child: categoryImage(widget.nameProduct)))
              : (widget.productImage != null && widget.productImage!.isNotEmpty
                  ? Image.network(widget.productImage!,
                      errorBuilder: (context, error, stackTrace) =>
                          Center(child: categoryImage(widget.nameProduct)))
                          //const Icon(Icons.broken_image))
                  : Center(child: categoryImage(widget.nameProduct))),
        ),
        if (widget.IsOffer == true)
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
    );
  }
}
