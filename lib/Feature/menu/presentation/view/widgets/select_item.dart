import 'package:flutter/material.dart';

import '../../../../../core/routing/app_router.dart';

void selectItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).pushNamed(AppRouter.profilePath);
      break;
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
  }
}
