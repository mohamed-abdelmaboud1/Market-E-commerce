import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/product_widget.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view_models/brand_and_categories/brand_and_category_state.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../view_models/brand_and_categories/category_cubit.dart';

class DetailsCategorySection extends StatefulWidget {
  DetailsCategorySection({
    super.key,
    this.isScrollerV = false,
  });
  bool isScrollerV;
  @override
  State<DetailsCategorySection> createState() => _DetailsCategorySectionState();
}

class _DetailsCategorySectionState extends State<DetailsCategorySection> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchProducts();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, BrandAndCategoryState>(
        listener: (context, State) {
      // if (State is BrandAndCategoryLoaded) {
      //   customSnackBar(context, "category Loaded successfully", Colors.green);
      // } else if (State is BrandAndCategoryError) {
      //   customSnackBar(context, State.errMessage, Colors.red);
      //   print("Error message of get product is ${State.errMessage}");
      // }
    }, builder: (context, state) {
      if (state is BrandAndCategoryLoaded) {
        final categories = state.products;
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
                  children: categories
                      .map((brand) => InkWell(
                            onTap: () {
                              context.push(AppRouter.detailsProductPath,
                                  extra: categories);
                            },
                            child: ProductWidget(
                              imageWidth: double.infinity,
                              imageHight: 120,
                              productImage: brand.ImagePath.isNotEmpty
                                  ? "${brand.ImagePath[0].replaceAll('\\', '/')}"
                                  : ImagePathes.notExistPhoto,
                              productName: brand.name,
                            ),
                          ))
                      .toList(),
                )
              : SizedBox(
                  height: 25.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ProductWidget(
                          imageWidth: 24.w,
                          imageHight: 120,
                          isImageMemory: true,
                          productImage: category.ImagePath.isNotEmpty
                              ? "${category.ImagePath.replaceAll('\\', '/')}"
                              : ImagePathes.notExistPhoto,
                          productName: category.name,
                        ),
                      );
                    },
                  ),
                ),
        );
      } else if (state is BrandAndCategoryLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is BrandAndCategoryError) {
        return Center(child: Text("${state.errMessage}"));
      } else {
        return Center(child: Text("No Category available"));
      }
    });
  }
}
