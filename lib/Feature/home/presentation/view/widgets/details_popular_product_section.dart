import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/widgets/core/custom_snack_bar.dart';
import '../../view_models/Product/product_cubit.dart';
import '../../view_models/Product/product_state.dart';

class DetailsPopularProductSection extends StatefulWidget {
  DetailsPopularProductSection({
    super.key,
    this.isScrollerV = false,
  });
  bool isScrollerV;

  @override
  State<DetailsPopularProductSection> createState() =>
      _DetailsPopularProductSectionState();
}

class _DetailsPopularProductSectionState
    extends State<DetailsPopularProductSection> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchProducts();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(listener: (context, State) {
      if (State is ProductLoaded) {
        //customSnackBar(context, "Product Loaded successfully", Colors.green);
      } else if (State is ProductError) {
        //customSnackBar(context, State.errMessage, Colors.red);
        print("Eror message of get product is ${State.errMessage}");
      }
    }, builder: (context, state) {
      if (state is ProductLoaded) {
        final products = state.products;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          child: widget.isScrollerV == true
              ? GridView.count(
                  crossAxisCount: 2, // عدد الأعمدة
                  crossAxisSpacing: 2.h,
                  mainAxisSpacing: 2.h,
                  shrinkWrap: true,
                  childAspectRatio: 0.75, // نسبة العرض للارتفاع
                  physics:
                      const NeverScrollableScrollPhysics(), // علشان متتداخلش مع Scroll خارجي
                  children: products
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
                            ),
                          ))
                      .toList(),
                )
              : SizedBox(
                  height: 28.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 2.w),
                        child: InkWell(
                          onTap: () {
                            context.push(AppRouter.detailsProductPath,
                                extra: product);
                          },
                          child: ProductWidget(
                            imageWidth: 40.w,
                            imageHight: 120,
                            productImage: product.images.isNotEmpty
                                ? "${product.images[0].replaceAll('\\', '/')}"
                                : ImagePathes.notExistPhoto,
                            price: "${product.price} LE",
                            rating: product.rating!.toStringAsFixed(1),
                            productName: product.category,
                            IsOffer: true,
                            isAdd: true,
                            isFav: true,
                          ),
                        ),
                      );
                    },
                  ),
                ),
        );
      } else if (state is ProductLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ProductError) {
        return Center(child: Text("${state.errMessage}"));
      } else {
        return Center(child: Text("No products available"));
      }
    });
  }
}
