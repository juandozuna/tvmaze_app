import 'package:flutter/material.dart';

class InitProvider {
  final GlobalKey<NavigatorState> navigatorKey;

  InitProvider(
    this.navigatorKey,
  );

  bool _isInit = false;

  void init() {
    if (_isInit) return;
    _init();
    _isInit = true;
  }

  void _init() {
    //TODO: App initializer
  }
}
