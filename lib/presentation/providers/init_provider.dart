import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';

class InitProvider {
  final GlobalKey<NavigatorState> navigatorKey;

  InitProvider(
    this.navigatorKey,
  );

  bool _isInit = false;

  void init() {
    // This check is to prevent rerunning the code, during hot reloads mostly.
    if (_isInit) return;
    _init();
    _isInit = true;
  }

  /// Anything that should be checked in the app upon initializing
  void _init() {
    final nav = navigatorKey.currentState;
    nav?.pushReplacementNamed(AppRoute.shows);
  }
}
