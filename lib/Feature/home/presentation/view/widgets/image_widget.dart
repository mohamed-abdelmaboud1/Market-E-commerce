
import 'dart:typed_data';

import 'package:flutter/material.dart';

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
      this.isImageMemory = false});
  String? productImage;
  Uint8List? imageMemory;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  bool? isAdd;
  bool? isImageMemory;

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
                  : const Icon(Icons.broken_image))
              : (widget.productImage != null && widget.productImage!.isNotEmpty
                  ? Image.network(widget.productImage!,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image))
                  : const Icon(Icons.broken_image)),
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
