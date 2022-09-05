import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/episode/episode_provider.dart';

class EpisodePage extends StatefulWidget {
  const EpisodePage({Key? key}) : super(key: key);

  @override
  State<EpisodePage> createState() => _EpisodePageState();
}

class _EpisodePageState extends State<EpisodePage> {
  @override
  void dispose() {
    get<EpisodeProvider>().resetProvider();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EpisodeProvider>(context);
    return Container();
  }
}
