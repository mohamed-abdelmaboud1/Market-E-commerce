import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:marketi_ecommers/core/widgets/bottom_navigation.dart';

import '../../../menu/presentation/view/menu_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      endDrawer: const NavigationMenuDrawerWidget(),
      bottomNavigationBar: Builder(
        builder: (ctx) => Bottomnavigation(
          onMenuTap: () {
            Scaffold.of(ctx).openEndDrawer();
          },
        ),
      ),
    );
  }
}
