import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/init/app_init.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    supportedLocales: ['en'],
  );

  final providers = init();

  runApp(LocalizedApp(delegate, TvMazeApp(providers)));
}

class TvMazeApp extends StatelessWidget {
  final List<SingleChildWidget> providers;

  const TvMazeApp(
    this.providers, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MultiProvider(
        providers: providers,
        builder: (ctx, child) => const AppInit(),
      ),
    );
  }
}
