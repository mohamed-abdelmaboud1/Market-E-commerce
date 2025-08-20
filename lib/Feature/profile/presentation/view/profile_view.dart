import 'package:flutter/material.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key,required this.themeNotifier});
 final ValueNotifier<ThemeMode> themeNotifier;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(themeNotifier:themeNotifier ),
    );
  }
}
