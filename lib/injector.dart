import 'package:get_it/get_it.dart';

final _injector = GetIt.instance;

Future<void> _init() async {
  // Injector.init();
}

/// Will get a registered type from the injector.
T get<T>() => _injector<T>();
