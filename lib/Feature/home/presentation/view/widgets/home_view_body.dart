import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/bar_home_Sec.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_banners_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_brands_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_popular_product_section.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/category_view_widget.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:sizer/sizer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BarHomeSection(),
          SizedBox(
            height: 3.h,
          ),
          InkWell(
            child:  const SearchWidget(),
            onTap: () {
              context.go(AppRouter.searchNotFoundPage);
            },
          ),
        
          DetailsBannersSection(),
          
          CategoryViewWidget(text: "Popular Product",
              location: AppRouter.popularProductPagePath),

          DetailsPopularProductSection(),

          //second section
          CategoryViewWidget(text: "Category",
              location: AppRouter.allCategoriesPagePath),

          DetailsCategorySection(),
          //DetailsCategorySection(),
          //

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ProductWidget(
          //           imageWidth: 30.w,
          //           imageHight: 120,
          //           productImage: ImagePathes.notExistPhoto,
          //           productName: "Phones"),
          //       ProductWidget(
          //           imageWidth: 30.w,
          //           imageHight: 120,
          //           productImage: ImagePathes.notExistPhoto,
          //           productName: "Food"),
          //       ProductWidget(
          //           imageWidth: 25.w,
          //           imageHight: 120,
          //           productImage: ImagePathes.notExistPhoto,
          //           productName: "Fashion"),
          //     ],
          //   ),
          // ),

          //
          CategoryViewWidget(text: "Best for You",
              location: AppRouter.bestForYouPagePath),

          DetailsPopularProductSection(),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ProductWidget(
          //         productImage: ImagePathes.notExistPhoto,
          //         imageWidth: 30.w,
          //         imageHight: 120,
          //         price: "799 LE",
          //         productName: "Black JBL Airbods",
          //         IsOffer: true,
          //         isFav: true,
          //         isAdd: true,
          //       ),
          //       ProductWidget(
          //         productImage: ImagePathes.notExistPhoto,
          //         imageWidth: 30.w,
          //         imageHight: 10.h,
          //         price: "13999 LE",
          //         productName: "Sony Smart TV 55 inch ",
          //         isFav: true,
          //         isAdd: true,
          //       ),
          //     ],
          //   ),
          // ),
          //
          CategoryViewWidget(text: "Brands",
              location: AppRouter.allBrandsPagePath),

          DetailsBrandsSection(),
          //
          CategoryViewWidget(text: "Buy Again",
              location: AppRouter.buyAgainPagePath),
          DetailsPopularProductSection(),

          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ProductWidget(
          //         imageWidth: 30.w,
          //         imageHight: 120,
          //         productImage: ImagePathes.notExistPhoto,
          //         price: "399 LE",
          //         productName: "Black Sony Headphone",
          //         isFav: true,
          //         isAdd: true,
          //       ),
          //       ProductWidget(
          //         imageWidth: 30.w,
          //         imageHight: 120,
          //         productImage: ImagePathes.notExistPhoto,
          //         price: "14999 LE",
          //         productName: "HP Chromebook laptop",
          //         isFav: true,
          //         isAdd: true,
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
