import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';

class ShowDetailContent extends StatelessWidget {
  final ShowViewModel show;

  const ShowDetailContent(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildTopRow(context),
        ],
      ),
    );
  }

  Widget _buildTopRow(BuildContext context) {
    return Row(
      children: [
        _buildImage(context),
        Expanded(child: Html(data: show.summary)),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.45;
    return CachedNetworkImage(
      imageUrl: show.posterImage,
      width: width,
    );
  }
}
