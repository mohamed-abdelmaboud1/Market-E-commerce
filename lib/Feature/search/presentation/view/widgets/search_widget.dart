import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';
import 'package:sizer/sizer.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});
  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What are you looking for ?',
          prefixIcon: Icon(
            Icons.search,
            size: 6.w,
            color: const Color(0XFF001640),
          ),
          suffixIcon: Icon(
            Icons.filter_list,
            size: 6.w,
            color: PrimaryColor,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: const BorderSide(
              color: Color.fromARGB(176, 21, 211, 233),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: const BorderSide(
              color: Color.fromARGB(176, 21, 211, 233),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.w),
            borderSide: const BorderSide(
              color: Color.fromARGB(175, 10, 178, 196),
            ),
          ),
        ),
      ),
    );
  }
}
