import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primarySwatch = Colors.teal;
  static Color oddListBackground = Colors.grey.shade300;
}

class AppValues {
  static const double showItemWidth = 100;
}

class AppTheme {
  static getTheme() {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
