import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';
import 'package:tvmaze_app/presentation/routes/route_generator.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class AppInit extends StatelessWidget {
  const AppInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
      state: LocalizationProvider.of(context).state,
      child: MaterialApp(
        title: 'TvMaze',
        theme: AppTheme.getTheme(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          localizationDelegate,
        ],
        supportedLocales: localizationDelegate.supportedLocales,
        locale: localizationDelegate.currentLocale,
        initialRoute: AppRoute.initialRoute,
        routes: RouteGenerator.routes,
        navigatorKey: getNavigator(),
      ),
    );
  }
}
