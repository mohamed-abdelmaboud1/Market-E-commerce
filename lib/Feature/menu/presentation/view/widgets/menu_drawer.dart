import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';

class NavigationMenuDrawerWidget extends StatelessWidget {
  const NavigationMenuDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(ImagePathes.profile), // صورة البروفايل
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome,",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Dina",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  )
                ],
              ),
            ),
            const Divider(height: 2,color: Color.fromARGB(179, 169, 168, 168),),
                   SizedBox(height: 2.h),

            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  drawerItem(Icons.refresh, "Buy Again"),
                  drawerItem(Icons.shopping_bag_outlined, "My Orders"),
                  drawerItem(Icons.credit_card, "Payments"),
                  drawerItem(Icons.settings, "Account Settings"),
                  drawerItem(Icons.support_agent, "Support"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      onTap: () {
      },
    );
  }
}

void selectItem(BuildContext context, int index) {
 switch (index) {
    case 0:
      Navigator.of(context).pushNamed(AppRouter.profilePath);
      break;
    case 1:
      // Navigate to My Orders
      break;
    case 2:
      // Navigate to Payments
      break;
    case 3:
      // Navigate to Account Settings
      break;
    case 4:
      // Navigate to Support
      break;
  }
}