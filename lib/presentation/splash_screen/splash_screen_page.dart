import 'package:flutter/material.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/providers/init_provider.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    get<InitProvider>().init();
  }

  @override
  Widget build(BuildContext context) {
    return const CenterLoading();
  }
}
