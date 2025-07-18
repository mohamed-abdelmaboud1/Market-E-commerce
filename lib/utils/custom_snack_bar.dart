import 'package:flutter/material.dart';

void customSnackBar(context, String text,Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Center(child: Text(text)),
    ),
  );
}