import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constant/app_router.dart' show AppRouter;

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
  int value = 0;
  List<String> bodyPush = [
    AppRouter.homePath,
    AppRouter.cartEmpty,
    AppRouter.cartEmpty,
    AppRouter.loginPath
  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: value,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color(0xff67687E),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xff67687E),
        ),
        showUnselectedLabels: true,
        onTap: (int x) {
          setState(() {
            value = x;
          });
          context.push(bodyPush[value]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ]);
  }
}
