import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/category_image.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';

import '../../../../favorite/presentation/view_models/add_to_fav/add_to_fav_cubit.dart';
import '../../../../favorite/presentation/view_models/delete_from_fav/delete_from_fav_cubit.dart';

class ImageWidget extends StatefulWidget {
  ImageWidget({
    super.key,
    this.productImage,
    this.imageHight,
    required this.imageWidth,
    this.IsOffer,
    this.isFav,
    this.isFavPage,
    this.isAdd,
    required this.nameProduct,
    required this.productId,
    this.onRemove,
  });
  String? productImage;
  double imageWidth;
  double? imageHight;
  bool? IsOffer = false;
  bool? isFav;
  bool? isFavPage;
  bool? isAdd;
  String nameProduct;
  final String productId;
  final VoidCallback? onRemove;
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  bool isFav = false;
  bool FavPage = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: widget.imageWidth,
          height: widget.imageHight,
          child: (widget.productImage != null && widget.productImage!.isNotEmpty
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
                isFav
                    ? context
                        .read<AddToFavCubit>()
                        .addToProductCart(widget.productId)
                    : context
                        .read<DeleteFromFavCubit>()
                        .deleteProductCart(widget.productId);

                if (widget.isFavPage == true&& !isFav) {
                  widget.onRemove?.call();
                }
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
