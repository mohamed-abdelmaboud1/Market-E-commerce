import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/favorite/presentation/view/fav_view.dart';
import 'package:marketi_ecommers/Feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:marketi_ecommers/core/widgets/bottom_navigation.dart';

import '../../../cart/presentation/view/cart_view.dart';
import '../../../menu/presentation/view/menu_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> screens = const [
    HomeViewBody(),
    CartView(),
    FavView(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          endDrawer: const NavigationMenuDrawerWidget(),
          bottomNavigationBar: Builder(
            builder: (ctx) => Bottomnavigation(
              onMenuTap: () {
                Scaffold.of(ctx).openEndDrawer();
              },
            ),
          ),
        );
      },
    );
  }
}
