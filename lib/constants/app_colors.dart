import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color backgroundColor = Color(0XFFE0E0E0);
  static const primaryColor = Color(0XFF009396);
  static Color purpleColor = const Color(0XFF6A0DAD).withOpacity(0.9);
  static const purpleBlueColor = Color(0XFF3a29b9);
  static const greenColor = Color(0XFF008080);
  static const blueColor = Color(0XFF0653D8);
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const textGrey = Color(0XFF8A8A8A);
  static const darkGrey = Color(0XFF555555);
  static const mediumGrey = Color(0XFFA7A7A7);
  static const lightGrey = Color(0XFFD0CFCF);
  static const red = Color(0XFFF80000);
  static Color tealColor = const Color(0XFF009396).withOpacity(0.9);

  static List<Color> randomColors = [
    purpleColor,
    greenColor,
    blueColor,
    purpleBlueColor,
    tealColor
  ];
}
