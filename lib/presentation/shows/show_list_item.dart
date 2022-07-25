import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/models/single_show.dart';

class ShowListItem extends StatelessWidget {
  final SingleShow show;

  const ShowListItem(this.show, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: CachedNetworkImageProvider(show.posterImage),
      ),
      title: Text(show.name),
      subtitle: Text(show.rating.toString()),
    );
  }
}
