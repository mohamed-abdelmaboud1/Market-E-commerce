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
          DetailsCategorySection(),
      
          CategoryViewWidget(text: "Best for You",
              location: AppRouter.bestForYouPagePath),

          DetailsPopularProductSection(),
          CategoryViewWidget(text: "Brands",
              location: AppRouter.allBrandsPagePath),

          DetailsBrandsSection(),
          //
          CategoryViewWidget(text: "Buy Again",
              location: AppRouter.buyAgainPagePath),
          DetailsPopularProductSection(),
          SizedBox(height: 2.h,),
        ],
      ),
    );
  }
}
