import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const primaryColor = Color(0xFF2697FF);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Colors.white;
const yellowColor = Color(0xFFFFB746);
const pinkColor = Color(0xFFff4657);
const whiteColor = Colors.white;
const darkGreyColor = Color(0xFF121212);
const darkHeaderColor = Color(0xFF424242);
const kPrimaryLightColor = Color(0xFFF1E6FF);
const Color mainBlackColor = Color(0xFF332d2b);
const Color appBarColor = Color(0xFF00598E);
const Color dialogBackgroundColor = Color(0xFF102F57);
const defaultPadding = 16.0;

class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    primaryColor: primaryColor,
    brightness: Brightness.light,
    canvasColor: secondaryColor
  );

  static final dark = ThemeData(
    backgroundColor: darkGreyColor,
    primaryColor: darkGreyColor,
    brightness: Brightness.dark,
  );
}

TextStyle header1Style({
  required double fontSize,
  Color color = Colors.white,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return TextStyle(
    fontWeight: fontWeight,
    fontSize: fontSize.sp,
    color: color,
  );
}

TextStyle get headerStyle {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get subHeaderStyle {
  return TextStyle(
    fontSize: 24.sp,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[800],
  );
}

TextStyle get headerStyle2 {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24.sp,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  );
}

TextStyle get subHeaderStyle2 {
  return TextStyle(
    fontSize: 22.sp,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey[800],
  );
}
