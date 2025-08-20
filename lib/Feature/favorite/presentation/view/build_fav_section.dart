import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view_models/get_fav/get_fav_cubit.dart';
import 'package:marketi_ecommers/Feature/home/data/models/product_model.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/routing/app_router.dart';
import '../../../../core/utils/image_pathes.dart';
import '../../../../core/widgets/four_orgnaized_widget.dart';
import '../../../home/presentation/view/widgets/product_widget.dart';
import '../view_models/get_fav/get_fav_state.dart';

Widget buildFavSection(bool showInternalLoading) {
  return BlocBuilder<GetFavCubit, GetFavState>(
    builder: (context, state) {
      if (state is GetFavLoading) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        );
      } else if (state is GetFavLoaded) {
        final products = state.products;
        if (state.products.isEmpty) {
          return FourOrgnaizedWidget(
            image: Image.asset(
              ImagePathes.image10,
              width: 200.w,
              height: 30.h,
            ),
            textBold: "Your Favorites page is Empty",
            textNormal:
                "Check our big offers, fresh products and fill your cart with items",
            textButton: "Start Shopping",
          );
        } else {
          return FavViewContent(products: products);
        }
      } else if (state is GetFavError) {
        return Center(child: Text(state.errMessage));
      } else {
        return Center(child: Text("No products available"));
      }
    },
  );
}

class FavViewContent extends StatefulWidget {
  const FavViewContent({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  State<FavViewContent> createState() => _FavViewContentState();
}

class _FavViewContentState extends State<FavViewContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
        child: GridView.count(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 2.h,
          mainAxisSpacing: 2.h,
          shrinkWrap: true,
          childAspectRatio: 0.75, // نسبة العرض للارتفاع
          padding: EdgeInsets.zero,
          children: widget.products
              .map((product) => InkWell(
                    onTap: () {
                      context.push(AppRouter.detailsProductPath,
                          extra: product);
                    },
                    child: ProductWidget(
                        imageWidth: double.infinity,
                        imageHight: 120,
                        productImage: product.images.isNotEmpty
                            ? "${product.images[0].replaceAll('\\', '/')}"
                            : ImagePathes.notExistPhoto,
                        productName: product.title,
                        isAdd: true,
                        rating: product.rating!.toStringAsFixed(1),
                        price: "${product.price} LE",
                        productId: product.id,
                        isFav: true,
                        isFavPage: true,
                        onRemove: () {
                          setState(() {
                            widget.products
                                .removeWhere((p) => p.id == product.id);
                          });
                        }),
                  ))
              .toList(),
        ));
  }
}
