import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class PinCodeWidget extends StatelessWidget {
   PinCodeWidget({super.key,required this.codeController});
  TextEditingController codeController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: PinCodeTextField(
        controller: codeController,
        appContext: context,
        length: 6,
        onChanged: (value) {
          print(value);
        },
        onCompleted: (value) {
          print("Completed: $value");
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          activeColor: PrimaryColor,
          selectedColor: PrimaryColor,
          inactiveColor: Colors.grey.shade300,
          activeFillColor: Colors.white,
          selectedFillColor: Colors.white,
          inactiveFillColor: Colors.white,
        ),
        keyboardType: TextInputType.number,
        enableActiveFill: true,
      ),
    );
  }
}
