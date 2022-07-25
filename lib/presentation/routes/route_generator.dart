import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';
import 'package:tvmaze_app/presentation/splash_screen/splash_screen_page.dart';

class RouteGenerator {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.splashScreen: (context) => const SplashScreenPage(),
  };
}
