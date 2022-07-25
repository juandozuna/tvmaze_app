import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tvmaze_app/data/remote_service_factory.dart';
import 'package:tvmaze_app/data/repositories/show_data_repository.dart';
import 'package:tvmaze_app/data/services/show_service.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';

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

void _registerNetworkService() {
  _injector.registerSingleton<Dio>(createDioClient());
}

void _registerServices() {
  final client = get<Dio>();

  _injector.registerSingleton<ShowService>(ShowService(client));
}

void _registerRepositories() {
  _injector.registerSingleton<ShowRepository>(
    ShowDataRepository(get<ShowService>()),
  );
}

void _registerUseCases() {}

void _registerProviders() {}

/// Will get a registered type from the injector.
T get<T>() => _injector<T>();
