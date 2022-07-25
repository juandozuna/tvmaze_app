import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primarySwatch = Colors.teal;
}

class AppSizes {}

class AppTheme {
  static getTheme() {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
