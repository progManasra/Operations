// ignore_for_file: deprecated_member_use

import 'package:app01/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "PlayfairDisplay",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
    bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);

ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    // ignore: deprecated_member_use
    headline1: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
    headline2: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
    bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16),
    bodyText2: TextStyle(height: 2, color: AppColor.grey, fontSize: 14),
  ),
  primarySwatch: Colors.blue,
);
