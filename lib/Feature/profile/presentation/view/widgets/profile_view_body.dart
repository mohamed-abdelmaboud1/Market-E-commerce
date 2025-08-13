import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/widgets/bar_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BarWidget(
          textBar: "My Profile",
          isIcon: true,
        ),

      ],
    );
  }
}