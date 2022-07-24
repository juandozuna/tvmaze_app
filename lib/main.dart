import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/init/app_init.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final providers = init();

  runApp(TvMazeApp(providers));
}

class TvMazeApp extends StatelessWidget {
  final List<SingleChildWidget> providers;

  const TvMazeApp(
    this.providers, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: const AppInit(),
    );
  }
}
