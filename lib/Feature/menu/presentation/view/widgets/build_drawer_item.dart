import 'package:flutter/material.dart';
import 'package:marketi_ecommers/core/utils/colors.dart';

Widget drawerItem(IconData icon, String title,BuildContext context) {
  return ListTile(
    leading: Icon(icon, color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black45 
                              : PrimaryColor),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    onTap: () {},
  );
}


