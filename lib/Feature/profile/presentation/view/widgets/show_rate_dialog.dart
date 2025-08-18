import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:marketi_ecommers/core/utils/image_pathes.dart';
import 'package:marketi_ecommers/core/widgets/core/custom_text__widget.dart';
import 'package:sizer/sizer.dart';

void showRateUsDialog(BuildContext context) {
  double rating = 0;

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "How would you rate us ?",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Image.asset(
              ImagePathes.logo,
              height: 15.h,
            ),
            const SizedBox(height: 15),
            RatingBar.builder(
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (value) {
                rating = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel"),
          ),
          SizedBox(width: 30.w,),
          TextButton(
            onPressed: () {
              debugPrint("User Rating: $rating");
              Navigator.pop(context);
               ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: CustomTextWidget(color: Colors.black, fontSize: 20, text: "Thanks for rating us ${"⭐" * rating.toInt()}"),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: const Text("Ok"),
          ),
        ],
      );
    },
  );
}
