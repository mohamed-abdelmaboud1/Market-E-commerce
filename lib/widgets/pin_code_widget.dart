import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marketi_ecommers/constant/colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class PinCodeWidget extends StatelessWidget {
  const PinCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 7.h),
      child: PinCodeTextField(
        appContext: context,
        length: 4, 
        onChanged: (value) {
          print(value); 
        },
        onCompleted: (value) {
          print("Completed: $value"); 
        },
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 65,
          fieldWidth: 65,
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
