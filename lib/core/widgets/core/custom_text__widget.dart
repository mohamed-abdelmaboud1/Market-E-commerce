import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({
    required this.color,
    required this.fontSize,
     this.fontWeight,
    required this.text,
    this.textAlign,
    this.maxLines = 3,
  });
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textAlign: textAlign ?? TextAlign.center,
      maxLines: maxLines,
      softWrap: true, // يخلي النص يلف على سطر جديد
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
