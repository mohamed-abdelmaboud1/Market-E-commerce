import 'package:flutter/material.dart';

Color PrimaryColor = Color(0xFF3F80FF);
Color TextColor = Color(0xFF001640);
Color BorderColor = Color(0xffB2CCFF);


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: TextColor),
    bodyMedium: TextStyle(color: TextColor.withOpacity(0.7)),
    titleLarge: TextStyle(color: TextColor, fontWeight: FontWeight.bold),
  ),
  dividerColor: BorderColor,
  colorScheme: ColorScheme.light(
    primary: PrimaryColor,
    secondary: BorderColor,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: PrimaryColor,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white70),
    titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),
  dividerColor: BorderColor,
  colorScheme: ColorScheme.dark(
    primary: PrimaryColor,
    secondary: BorderColor,
  ),
);