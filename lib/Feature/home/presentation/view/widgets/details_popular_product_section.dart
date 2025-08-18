import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/build_product_section_on_view_all.dart';
import '../../../../favorite/presentation/view/build_fav_section.dart';
import '../../../../favorite/presentation/view_models/get_fav/get_fav_cubit.dart';
import '../../view_models/Product/product_cubit.dart';

class DetailsPopularProductSection extends StatefulWidget {
  DetailsPopularProductSection({
    super.key,
    this.isScrollerV = false,
    this.showInternalLoading = true,
    this.isFav = false,
  });
  bool isScrollerV;
  final bool showInternalLoading;
  final bool isFav;

  @override
  State<DetailsPopularProductSection> createState() =>
      _DetailsPopularProductSectionState();
}

class _DetailsPopularProductSectionState
    extends State<DetailsPopularProductSection> {
  @override
  void initState() {
    super.initState();
    if (!widget.isFav) {
      context.read<ProductCubit>().fetchProducts();
    } else {
      context.read<GetFavCubit>().fetchProducts();
    }
  }

  Widget build(BuildContext context) {
    return widget.isFav
        ? buildFavSection(widget.showInternalLoading)
        : buildProductSection(widget.isScrollerV, widget.showInternalLoading);
  }
}
