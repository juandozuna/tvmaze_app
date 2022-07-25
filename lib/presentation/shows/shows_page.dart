import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/providers/shows_provider.dart';
import 'package:tvmaze_app/presentation/shows/show_list_item.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';

class ShowsPage extends StatefulWidget {
  const ShowsPage({Key? key}) : super(key: key);

  @override
  State<ShowsPage> createState() => _ShowsPageState();
}

class _ShowsPageState extends State<ShowsPage> {
  @override
  void initState() {
    super.initState();
    get<ShowsProvider>().getShows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('shows')),
      ),
      body: Consumer<ShowsProvider>(
        builder: (ctx, value, child) {
          if (value.isLoading && value.isInitialLoad) {
            return const CenterLoading();
          }
          final shows = value.shows.toList();
          return ListView.builder(
            itemCount: shows.length,
            itemBuilder: (ctx, i) => ShowListItem(
              shows[i],
              i % 2 == 0,
              key: ValueKey(shows[i].id),
            ),
          );
        },
      ),
    );
  }
}
