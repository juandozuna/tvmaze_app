import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/shows/shows_provider.dart';
import 'package:tvmaze_app/presentation/shows/show_list/show_list_view.dart';
import 'package:tvmaze_app/presentation/shows/show_list_item.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';
import 'package:tvmaze_app/presentation/widgets/search_app_bar.dart';

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
      appBar: SearchAppBar(
        title: translate('shows'),
        onSearch: onSearch,
      ),
      body: Consumer<ShowsProvider>(
        builder: (ctx, value, child) {
          if (value.isLoading && value.isInitialLoad) {
            return const CenterLoading();
          }
          final shows = value.shows.toList();
          return ShowListView(shows: shows);
        },
      ),
    );
  }

  void onSearch(String value) {}
}
