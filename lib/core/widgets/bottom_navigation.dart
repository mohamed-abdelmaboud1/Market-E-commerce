import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/cart/presentation/view_models/get_cart/get_cart_cubit.dart';

import '../../Feature/favorite/presentation/view_models/get_fav/get_fav_cubit.dart';

class Bottomnavigation extends StatelessWidget {
  const Bottomnavigation({super.key, this.onMenuTap});
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, currentIndex) {
        return BottomNavigationBar(
          // backgroundColor: Colors.white,
          // selectedItemColor: Colors.blue,
          // unselectedItemColor: const Color(0xff67687E),
          currentIndex: currentIndex,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
          unselectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
          showUnselectedLabels: true,
          onTap: (int index) {
            if (index == 3) {
              onMenuTap?.call();
            } else {
              context
                  .read<BottomNavCubit>()
                  .changeSelectedIndex(index, context);
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: "Favorites"),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
          ],
        );
      },
    );
  }
}

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changeSelectedIndex(int newIndex, BuildContext context) {
    emit(newIndex);

    if (newIndex == 1) {
      context.read<GetCartCubit>().fetchProducts();
    }
    if (newIndex == 2) {
      context.read<GetFavCubit>().fetchProducts();
    }
  }
}



//navigator using go router
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../routing/app_router.dart' show AppRouter;

// class Bottomnavigation extends StatefulWidget {
//   const Bottomnavigation({super.key, this.onMenuTap});
//   final VoidCallback? onMenuTap;
//   @override
//   State<Bottomnavigation> createState() => _BottomnavigationState();
// }

// class _BottomnavigationState extends State<Bottomnavigation> {
//   int value = 0;
//   List<String> bodyPush = [
//     AppRouter.homePath,
//     AppRouter.cartViewPath,
//     AppRouter.favoritesPath,
//     AppRouter.menuPath,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     final String location = GoRouterState.of(context).uri.toString();

//     int currentIndex = 0;
//     if (location.startsWith(AppRouter.homePath)) {
//       currentIndex = 0;
//     } else if (location.startsWith(AppRouter.cartViewPath)) {
//       currentIndex = 1;
//     } else if (location.startsWith(AppRouter.favoritesPath)) {
//       currentIndex = 2;
//     }

//     return BottomNavigationBar(
//         backgroundColor: Colors.white,
//         currentIndex: value,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: const Color(0xff67687E),
//         unselectedLabelStyle: const TextStyle(
//           color: Color(0xff67687E),
//         ),
//         showUnselectedLabels: true,
//         onTap: (int x) {
//           if (x == 3) {
//             widget.onMenuTap?.call();
//             return;
//           } else {
//             setState(() {
//               value = x;
//             });
//             context.push(bodyPush[value]);
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart), label: "Cart"),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: "Favorites",
//           ),
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
//         ]);
//   }
// }