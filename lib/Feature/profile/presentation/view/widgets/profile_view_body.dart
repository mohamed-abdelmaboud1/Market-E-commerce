import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_list.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/build_switch_list_tile.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/show_rate_dialog.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/user_data/user_data_state.dart';
import 'package:marketi_ecommers/core/routing/app_router.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../../../../core/services/theme_cubit.dart';
import '../../view_model/user_data/user_data_cubit.dart';
import '../../view_model/user_edit/user_edit_cubit.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({
    super.key,
  });

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
        ProfileSecInfo(),
        SizedBox(height: 2.h),

         Divider(color: Theme.of(context).brightness == Brightness.light
            ? const Color.fromARGB(179, 151, 146, 146).withOpacity(0.2)   
            : Colors.white30.withOpacity(0.2)  ,),
        SizedBox(height: 1.h),

        // Options List
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              buildListTile(
                context: context,
                icon: Icons.person_outline,
                text: "Account Preferences",
                onTap: () {},
              ),
              buildListTile(
                context: context,
                icon: Icons.credit_card,
                text: "Subscription & Payment",
                onTap: () {},
              ),
              switchListTile(
                context: context,
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
                context: context,

                icon: Icons.dark_mode_outlined,
                text: "Dark Mode",
                value: context.watch<ThemeCubit>().state ==
                    ThemeMode.dark, //isDarkMode,
                onChanged: (value) {
                  setState(() {
                    context.read<ThemeCubit>().toggleTheme();
                  });
                },
              ),
              buildListTile(
                context: context,
                icon: Icons.star_border,
                text: "Rate Us",
                onTap: () {
                  showRateUsDialog(context);
                },
              ),
              buildListTile(
                context: context,
                icon: Icons.feedback_outlined,
                text: "Provide Feedback",
                onTap: () {},
              ),
              buildListTile(
                context: context,
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

class ProfileSecInfo extends StatelessWidget {
  const ProfileSecInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserDataCubit>();

    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return CircularProgressIndicator();
        } else if (state is UserDataError) {
          return Text("There is an error${state.errMessage}");
        } else if (state is UserDataLoaded) {
          final user = state.userData;
          return Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(ImagePathes.profile),
                    ),
                    InkWell(
                      onTap: () {
                        context.go(AppRouter.editProfilePath);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.edit,
                            color: Colors.blue, size: 20),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 3.h),
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "@${user.email.replaceAll("@gmail.com", "")}",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
