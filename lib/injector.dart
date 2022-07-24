import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final _injector = GetIt.instance;

List<SingleChildWidget> init() {
  _initInjector();

  final providers = [];

  return providers.map((e) {
    if (e is ChangeNotifier) return ChangeNotifierProvider.value(value: e);
    return Provider.value(value: e);
  }).toList();
}

void _initInjector() {
  _registerNetworkService();
  _registerServices();
  _registerRepositories();
  _registerUseCases();
  _registerProviders();
}

void _registerNetworkService() {}

void _registerServices() {}

void _registerRepositories() {}

void _registerUseCases() {}

void _registerProviders() {}

/// Will get a registered type from the injector.
T get<T>() => _injector<T>();
