import 'package:flutter/material.dart';

Widget drawerItem(IconData icon, String title) {
  return ListTile(
    leading: Icon(icon, color: Colors.black),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    onTap: () {},
  );
}


