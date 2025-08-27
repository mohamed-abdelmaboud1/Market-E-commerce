import 'package:flutter/widgets.dart';

import '../category_image.dart';
import '../image_widget.dart';

class ImageSec extends StatelessWidget {
  const ImageSec({
    super.key,
    required this.widget,
  });

  final ImageWidget widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.imageWidth,
      height: widget.imageHight,
      child: (widget.productImage != null && widget.productImage!.isNotEmpty
          ? Image.network(widget.productImage!,
              errorBuilder: (context, error, stackTrace) =>
                  Center(child: categoryImage(widget.nameProduct)))
          //const Icon(Icons.broken_image))
          : Center(child: categoryImage(widget.nameProduct))),
    );
  }
}
