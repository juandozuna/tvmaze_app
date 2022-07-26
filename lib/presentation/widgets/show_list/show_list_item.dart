import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';
import 'package:tvmaze_app/presentation/theme/app_theme.dart';

class ShowListItem extends StatelessWidget {
  final ShowViewModel show;
  final bool isEven;

  const ShowListItem(this.show, this.isEven, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: !isEven ? AppColors.oddListBackground : Colors.transparent,
      leading: Image(
        image: CachedNetworkImageProvider(show.posterImage),
      ),
      title: Text(show.name),
      subtitle: Text(show.rating.toString()),
    );
  }
}
