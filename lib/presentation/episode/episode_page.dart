import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/episode/episode_provider.dart';
import 'package:tvmaze_app/presentation/widgets/error_container.dart';

import '../widgets/center_loading.dart';

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

    if (provider.isLoading) {
      return _buildScaffold(
        const CenterLoading(),
        provider,
      );
    }

    if (provider.hasError) {
      return _buildScaffold(
        ErrorContainer(errorMessage: provider.error.toString()),
        provider,
      );
    }

    return _buildScaffold(
      _buildContent(provider),
      provider,
    );
  }

  Widget _buildContent(EpisodeProvider provider) {
    final episode = provider.episode;
    return Container();
  }

  Widget _buildScaffold(Widget child, EpisodeProvider provider) {
    return Scaffold(
      appBar: _buildAppBar(provider),
      body: child,
    );
  }

  PreferredSizeWidget _buildAppBar(EpisodeProvider provider) {
    if (provider.hasError) {
      return AppBar(
        title: const Text('Error'),
      );
    }

    final hasEpisode = provider.hasEpisode;
    if (!hasEpisode) {
      return AppBar(
        title: const CenterLoading(),
      );
    }

    final episode = provider.episode!;
    return AppBar(
      title: Text(episode.name),
    );
  }
}
