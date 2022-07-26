import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';
import 'package:tvmaze_app/presentation/shows/show_list/show_list_item.dart';

class ShowListView extends StatefulWidget {
  final List<ShowViewModel> shows;

  const ShowListView({
    Key? key,
    required this.shows,
  }) : super(key: key);

  @override
  State<ShowListView> createState() => _ShowListViewState();
}

class _ShowListViewState extends State<ShowListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.shows.length,
      itemBuilder: (ctx, i) => ShowListItem(
        widget.shows[i],
        i % 2 == 0,
        key: ValueKey(widget.shows[i].id),
      ),
    );
  }
}
