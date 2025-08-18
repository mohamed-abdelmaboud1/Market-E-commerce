import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_list.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_switch_list_tile.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/show_rate_dialog.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/widgets/core/custom_text__widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  bool isNotificationOn = true;
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarWidget(
          textBar: "My Profile",
          isIcon: true,
        ),
        SizedBox(
          height: 3.h,
        ),
        // Profile Section
        Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage(ImagePathes.profile),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, color: Colors.blue, size: 20),
                  )
                ],
              ),
              SizedBox(height: 3.h),
              const Text(
                "Dina Maher",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "@dinamaher",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),

        const Divider(),
        SizedBox(height: 1.h),

        // Options List
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              buildListTile(
                icon: Icons.person_outline,
                text: "Account Preferences",
                onTap: () {},
              ),
              buildListTile(
                icon: Icons.credit_card,
                text: "Subscription & Payment",
                onTap: () {},
              ),
              switchListTile(
                icon: Icons.notifications_none,
                text: "App Notifications",
                value: isNotificationOn,
                onChanged: (value) {
                  setState(() {
                    isNotificationOn = value;
                  });
                },
              ),
              switchListTile(
                icon: Icons.dark_mode_outlined,
                text: "Dark Mode",
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
              buildListTile(
                icon: Icons.star_border,
                text: "Rate Us",
                onTap: () {
                   showRateUsDialog(context);
                },
              ),
              buildListTile(
                icon: Icons.feedback_outlined,
                text: "Provide Feedback",
                onTap: () {},
              ),
              buildListTile(
                icon: Icons.logout,
                text: "Log Out",
                onTap: () {},
                color: Colors.red,
              ),
            ],
          ),
        )
      ],
    );
  }
}
