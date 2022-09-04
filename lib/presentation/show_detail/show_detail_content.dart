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
        SliverToBoxAdapter(
          child: _buildTopRow(context),
        ),
        SliverToBoxAdapter(
          child: _buildAirTimeRow(context),
        ),
        const ShowDetailEpisodes(),
      ],
    );
  }

  Widget _buildTopRow(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.63;
    return Row(
      children: [
        Expanded(child: _buildImage(context)),
        SizedBox(
          width: width,
          child: Html(data: show.summary),
        ),
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
          Text(
            translate('airs_at', args: {'value': show.schedule!.time}),
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: AppValues.defaultMargin),
          Wrap(children: [for (final day in show.schedule!.days) Badge(day)])
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: show.posterImage,
      fit: BoxFit.fill,
    );
  }
}
