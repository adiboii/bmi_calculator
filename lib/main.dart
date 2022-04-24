import 'package:bmi_calculator/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/landing_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData,
      initialRoute: '/',
      routes: {
        '/': (context) => LandingPage(),
      },
    );
  }
}
