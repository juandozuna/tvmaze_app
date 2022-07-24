import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

Future<void> _init() async {
  _registerServices();
  _registerRepositories();
  _registerUseCases();
  _registerProviders();
}

void _registerNetworkService() {

}

void _registerServices() {}

void _registerRepositories() {}

void _registerUseCases() {}

void _registerProviders() {}

/// Will get a registered type from the injector.
T get<T>() => _injector<T>();
