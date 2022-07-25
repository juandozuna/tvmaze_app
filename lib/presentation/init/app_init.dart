import 'package:flutter/material.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';
import 'package:tvmaze_app/presentation/routes/route_generator.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TvMaze',
      theme: AppTheme.getTheme(),
      initialRoute: AppRoute.initialRoute,
      routes: RouteGenerator.routes,
      navigatorKey: getNavigator(),
    );
  }
}
