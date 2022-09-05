import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class EpisodeContent extends StatelessWidget {
  final EpisodeEntity entity;
  final int season;

  const EpisodeContent(this.entity, this.season, {super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildHeader(),
        _buildTitles(context),
        _buildSummary(context),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverAppBar(
      title: Text(entity.name),
      expandedHeight: 400,
      flexibleSpace: FlexibleSpaceBar(
        background: CachedNetworkImage(
          imageUrl: entity.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildTitles(BuildContext context) {
    final theme = Theme.of(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppValues.defaultPadding * 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              entity.name,
              style: theme.textTheme.headline4,
            ),
            const SizedBox(height: 4.0),
            Text(
              '${translate('season_no', args: {
                    'value': season
                  })} ${translate('episode_no', args: {
                    'value': entity.number
                  })}',
              style: theme.textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(AppValues.defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppValues.defaultMargin),
              child: Text(
                translate('summary'),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Html(
              data: entity.summary,
            ),
          ],
        ),
      ),
    );
  }
}
