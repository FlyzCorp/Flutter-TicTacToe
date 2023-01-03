import 'package:flutter/material.dart';

Color primaryColor = const Color(0xFFB75D69);
Color primaryColorLight = const Color(0xFFEACDC2);
Color primaryColorDark = const Color(0xFF774C60);
Color backgroundColor = const Color(0xFF1A1423);

ThemeData defaultTheme = ThemeData(
  primaryColorDark: primaryColorDark,
  primaryColor: primaryColor,
  primaryColorLight: primaryColorLight,
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: primaryColor,
    ),
    border: const UnderlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(style: BorderStyle.none),
    ),
    fillColor: primaryColorLight,
    filled: true,
  ),
);
