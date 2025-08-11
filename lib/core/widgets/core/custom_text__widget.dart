import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget(
      {required this.color,
      required this.fontSize,
      required this.fontWeight,
      required this.text,
      this.textAlign
      ,this.maxLines=3 ,
      });
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
  TextAlign? textAlign;
  int? maxLines ;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
