
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/Api/endpoints.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../checkout/data/models/check_out_model.dart';
import '../../../../checkout/data/models/checkout_model_product.dart';
import 'cart_view_body.dart';
import 'elevated_button_widget.dart';

class CheckOutSecWidget extends StatelessWidget {
  const CheckOutSecWidget({
    super.key,
    required this.widget,
  });

  final CartViewBody widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonWidget(
      textButton: "Check Out",
      onPressed: () {
        final checkoutProducts = widget.products.map((product) {
          return CheckOutModelProduct(
            products: widget.products,
            quantity: widget.products.length,
          );
        }).toList();
        context.push(AppRouter.checkOutPath,
            extra: CheckOutModel(
                userId: CacheHelper.getData(key: ApiKey.id),
                products: checkoutProducts));
      },
    );
  }
}
