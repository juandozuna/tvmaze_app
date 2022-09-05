import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/episode/episode_provider.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_provider.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';

class ShowDetailEpisodes extends StatelessWidget {
  const ShowDetailEpisodes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ShowDetailProvider>(context);
    if (provider.seasons.isNotEmpty) {
      return _buildContent(provider.seasons, context);
    }
    return FutureBuilder<List<SeasonEntity>>(
      future: provider.getEpisodesForShow(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(child: CenterLoading());
        }

        final data = snapshot.data ?? [];
        return _buildContent(data, context);
      },
    );
  }

  Widget _buildContent(List<SeasonEntity> seasons, BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        seasons
            .asMap()
            .entries
            .map(
              (pair) => _ShowSeason(
                pair.value,
                pair.key % 2 == 0,
                key: ValueKey(pair.value.season),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ShowSeason extends StatelessWidget {
  final SeasonEntity season;
  final bool isEven;

  const _ShowSeason(this.season, this.isEven, {super.key});

  @override
  Widget build(BuildContext context) {
    final episodes = season.episodes;

    return Container(
      padding: const EdgeInsets.all(AppValues.defaultMargin),
      color: !isEven ? AppColors.white : AppColors.oddListBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            translate('season_no', args: {'value': season.season}),
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: episodes.length,
              itemBuilder: (context, index) => _buildEpisode(
                episodes[index],
                context,
              ),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEpisode(EpisodeEntity episode, BuildContext context) {
    return InkWell(
      onTap: () {
        get<EpisodeProvider>().getEpisode(episode.id);
        Navigator.of(context).pushNamed(AppRoute.episode);
      },
      child: Container(
        margin: const EdgeInsets.only(
          right: AppValues.defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: episode.image,
              width: AppValues.episodeWidth,
              height: AppValues.episodeHeight,
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.only(
                left: AppValues.defaultPadding,
              ),
              child: Text(
                '${episode.number}. ${episode.name}',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
