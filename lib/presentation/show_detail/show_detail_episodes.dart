import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_provider.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';

class ShowDetailEpisodes extends StatelessWidget {
  const ShowDetailEpisodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowDetailProvider>(context);
    if (provider.seasons.isNotEmpty) {
      return _buildContent(provider.seasons);
    }
    return FutureBuilder<List<SeasonEntity>>(
      future: provider.getEpisodesForShow(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(child: CenterLoading());
        }

        final data = snapshot.data ?? [];
        return _buildContent(data);
      },
    );
  }

  Widget _buildContent(List<SeasonEntity> seasons) {
    return SliverList(
      delegate: SliverChildListDelegate(
        seasons.map((season) => _buildSeason(season)).toList(),
      ),
    );
  }

  Widget _buildSeason(SeasonEntity season) {
    return Container(
      margin: const EdgeInsets.all(AppValues.defaultMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(translate('season_no', args: {'value': season.season})),
          const SizedBox(height: 8),
          Wrap(
            children: season.episodes
                .map((episode) => _buildEpisode(episode))
                .toList(),
            alignment: WrapAlignment.spaceEvenly,
            spacing: AppValues.defaultMargin,
          )
        ],
      ),
    );
  }

  Widget _buildEpisode(EpisodeEntity episode) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: episode.image,
          width: AppValues.episodeWidth,
        ),
        const SizedBox(height: AppValues.defaultMargin),
        Text('${episode.number.toString()}: ${episode.name}'),
      ],
    );
  }
}
