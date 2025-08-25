import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/routing/app_router.dart';
import '../../../../../core/utils/image_pathes.dart';
import '../../view_model/user_edit/user_edit_cubit.dart';
import '../../view_model/user_edit/user_edit_state.dart';

class ProfileEditViewBody extends StatelessWidget {
  const ProfileEditViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<UserEditCubit, UserEditState>(builder: (context, state) {
      if (state is UserEditLoading) {
        return CircularProgressIndicator();
      } else if (state is UserEditError) {
        return Text("There is an error${state.errMessage}");
      } else if (state is UserEditLoaded) {
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
                      child:
                          const Icon(Icons.edit, color: Colors.blue, size: 20),
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
    });
  }
}
