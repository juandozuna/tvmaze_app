import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_episodes.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';
import 'package:tvmaze_app/presentation/widgets/badge.dart';

class ShowDetailContent extends StatelessWidget {
  final ShowViewModel show;

  const ShowDetailContent(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 500,
          floating: false,
          pinned: true,
          title: Text(show.name),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: _buildImage(context),
          ),
        ),
        SliverToBoxAdapter(
          child: _buildAirTimeRow(context),
        ),
        const ShowDetailEpisodes(),
      ],
    );
  }

  Widget _buildAirTimeRow(BuildContext context) {
    if (show.schedule == null) return Badge(translate('no_schedule'));

    return Padding(
      padding: const EdgeInsets.all(AppValues.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppValues.defaultPadding),
          Text(
            translate('airs_at', args: {'value': show.schedule!.time}),
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: AppValues.defaultMargin),
          Wrap(children: [for (final day in show.schedule!.days) Badge(day)]),
          const SizedBox(height: AppValues.defaultMargin),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: double.infinity,
          child: CachedNetworkImage(
            imageUrl: show.posterImage,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  AppColors.white.withAlpha(200),
                  Colors.transparent,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildGenres(context),
                _buildSummary(),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSummary() {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      child: Html(data: show.summary),
    );
  }

  Widget _buildGenres(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppValues.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            translate('genres'),
            style: Theme.of(context).primaryTextTheme.headline4,
          ),
          const SizedBox(height: AppValues.defaultPadding),
          Wrap(
            children: [for (final genre in show.genres) Badge(genre)],
          )
        ],
      ),
    );
  }
}
