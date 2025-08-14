import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi_ecommers/Feature/profile/presentation/view_model/user_data/user_data_cubit.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:marketi_ecommers/cubit/user_cubit/user_state.dart';
import 'package:sizer/sizer.dart';

import '../../../../profile/presentation/view_model/user_data/user_data_state.dart';

class BarHomeSection extends StatefulWidget {
  const BarHomeSection({
    super.key,
  });

  @override
  State<BarHomeSection> createState() => _BarHomeSectionState();
}

class _BarHomeSectionState extends State<BarHomeSection> {
  @override
  void initState() {
    super.initState();
    context.read<UserDataCubit>().fetchUserData();
  }

  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(builder: (context, state) {
      if (state is UserDataLoaded) {
        return Padding(
          padding: EdgeInsets.only(left: 3.h, top: 9.h),
          child: Row(
            children: [
              CircleAvatar(
                radius: 2.9.h,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 2.5.h,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: Image.asset(ImagePathes.profile, fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                width: 2.h,
              ),
              CustomTextWidget(
                text: "Hi, ${state.userData.name} !",
                fontSize: 3.h,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              SizedBox(
                width: 15.h,
              ),
              const Icon(
                Icons.notifications,
                color: Colors.blue,
              )
            ],
          ),
        );
      }
      return SizedBox();
    });
  }
}
