import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primarySwatch = Colors.teal;
  static Color oddListBackground = Colors.grey.shade300;
  static Color searchFieldBackground = Colors.grey.shade100;
  static Color white = Colors.white;
}

class AppValues {
  static const double showItemWidth = 100;
  static const double showItemHeight = 450;
  static const double episodeWidth = 100;
  static const double episodeHeight = 60;

  static const double defaultPadding = 8;
  static const double defaultMargin = 8;

  static const double defaultBorderRadius = 8;
  static const double circularRadius = 100;
}

class AppTheme {
  static getTheme() {
    return ThemeData(
      primarySwatch: AppColors.primarySwatch,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
