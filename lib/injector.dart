import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tvmaze_app/data/remote_service_factory.dart';
import 'package:tvmaze_app/data/repositories/show_data_repository.dart';
import 'package:tvmaze_app/data/services/show_service.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/useCases/get_show_by_id_use_case.dart';
import 'package:tvmaze_app/domain/useCases/get_shows_use_case.dart';
import 'package:tvmaze_app/domain/useCases/search_shows_by_name_use_case.dart';
import 'package:tvmaze_app/presentation/providers/init_provider.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_provider.dart';
import 'package:tvmaze_app/presentation/shows/shows_provider.dart';

final _injector = GetIt.instance;

List<SingleChildWidget> init() {
  _initInjector();

  final List<SingleChildWidget> providers = [
    Provider.value(value: get<InitProvider>()),
    ChangeNotifierProvider.value(value: get<ShowsProvider>()),
    ChangeNotifierProvider.value(value: get<ShowDetailProvider>()),
  ];

  return providers;
}

void _initInjector() {
  _registerNavKey();
  _registerNetworkService();
  _registerServices();
  _registerRepositories();
  _registerUseCases();
  _registerProviders();
}

void _registerNavKey() {
  _injector.registerSingleton<GlobalKey<NavigatorState>>(
    GlobalKey<NavigatorState>(),
  );
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

void _registerUseCases() {
  _injector.registerSingleton<GetShowsUseCase>(
    GetShowsUseCase(get<ShowRepository>()),
  );
  _injector.registerSingleton<SearchShowsByNameUseCase>(
    SearchShowsByNameUseCase(get<ShowRepository>()),
  );
  _injector.registerSingleton<GetShowByIdUseCase>(
    GetShowByIdUseCase(get<ShowRepository>()),
  );
}

void _registerProviders() {
  _injector.registerSingleton<InitProvider>(
    InitProvider(
      getNavigator(),
    ),
  );

  _injector.registerSingleton<ShowsProvider>(
    ShowsProvider(
      get<GetShowsUseCase>(),
      get<SearchShowsByNameUseCase>(),
      getNavigator(),
    ),
  );

  _injector.registerSingleton<ShowDetailProvider>(
    ShowDetailProvider(
      get<GetShowByIdUseCase>(),
    ),
  );
}

/// Will get a registered type from the injector.
T get<T extends Object>() => _injector<T>();

GlobalKey<NavigatorState> getNavigator() =>
    _injector<GlobalKey<NavigatorState>>();
