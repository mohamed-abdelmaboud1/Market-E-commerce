import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_category_section.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/details_popular_product_section.dart';
import 'package:marketi_ecommers/Feature/search/presentation/view/widgets/search_widget.dart';
import 'package:marketi_ecommers/core/widgets/core/title_of_product.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/bar_widget.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        BarWidget(
          textBar: 'Favorites',
        ),
        SizedBox(
          height: 2.h,
        ),
        SearchWidget(),
        SizedBox(
          height: 3.h,
        ),
        TitleOfPoducts(
          title: "All Products",
        ),
        Expanded(
          child: DetailsPopularProductSection(
            isScrollerV: true,
            isFav: true,
          ),
        ),
      ],
    );
  }
}
