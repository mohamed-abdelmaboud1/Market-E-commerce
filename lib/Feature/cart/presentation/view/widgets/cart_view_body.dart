import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/cart_product_widget.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view/widgets/elevated_button_widget.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../../../../core/widgets/core/custom_text__widget.dart';
import '../../../../../core/widgets/core/title_of_product.dart';
import '../../view_models/add_to_cart/add_to_cart_cubit.dart';
import '../../view_models/delete_from_cart/delete_from_cart_cubit.dart';
import '../../view_models/get_cart/get_cart_cubit.dart';
import '../../view_models/get_cart/get_cart_state.dart';

class CartViewBody extends StatefulWidget {
  CartViewBody({super.key, required this.products});
  List<ProductModel> products;
  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  bool isFav = false;
  int quantity = 0;
  double totalPrice = 0.0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 2.h,),
        TitleOfPoducts(
          title: "Products in Cart",
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.products.length,
            itemBuilder: (context, index) {
              final product = widget.products[index];
              totalPrice += product.price;
              return Padding(
                padding: EdgeInsets.only(right: 2.w),
                child: InkWell(
                  onTap: () {
                    context.push(AppRouter.detailsProductPath, extra: product);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CartProductWidget(
                        imageWidth: 40.w,
                        imageHight: 120,
                        productImage: product.images.isNotEmpty
                            ? "${product.images[0].replaceAll('\\', '/')}"
                            : ImagePathes.notExistPhoto,
                        price: "${product.price} LE",
                        rating: product.rating!.toStringAsFixed(1),
                        productName: product.category,
                        IsOffer: true,
                        isFav: true,
                        productId: product.id,
                        quantityRemain: product.remain!,
                        onRemove: () {
                          setState(() {
                            widget.products
                                .removeAt(index); 
                          });
                        }),
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
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
        ),
        SizedBox(
          height: 2.h,
        ),
        ElevatedButtonWidget(
          textButton: "Check Out",
          onPressed: (){
                    context.push(AppRouter.checkOutPath);

          },
        ),
         SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
