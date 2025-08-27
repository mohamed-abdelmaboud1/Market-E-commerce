
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/image_pathes.dart';

class RturnSection extends StatelessWidget {
  const RturnSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 3.h),
          child: Padding(
            padding: EdgeInsets.only(bottom: 20.w),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: BorderColor,
                    width: 2,
                  ),
                ),
                child: Center(
                    child: IconButton(
                  icon: Icon(
                    Icons.arrow_left_outlined,
                    size: 5.h,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
              ),
            ),
          ),
        ),
        
        Padding(
          padding: EdgeInsets.only(top: 4.h),
          child: Center(
            child: Image.asset(
              ImagePathes.logo,
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
