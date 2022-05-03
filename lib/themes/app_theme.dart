import 'package:flutter/material.dart';
import 'package:bmi_calculator/themes/app_color.dart';

ThemeData AppThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(
          color: AppColor.textColor,
        ),
        headline1: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
          color: AppColor.textColor,
        ),
        button: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColor.buttonText,
        )),
    colorScheme: ColorScheme.light());
