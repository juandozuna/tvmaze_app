import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/shows/shows_provider.dart';
import 'package:tvmaze_app/presentation/widgets/search_app_bar.dart';
import 'package:tvmaze_app/presentation/widgets/show_list/show_list_view.dart';

class ShowSearchPage extends StatelessWidget {
  const ShowSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = get<ShowsProvider>();
    return WillPopScope(
      onWillPop: () async {
        provider.clearSearch();
        return true;
      },
      child: Scaffold(
        appBar: SearchAppBar(
          title: translate('show_search'),
          searchPlaceholder: translate('search_placeholder'),
        ),
        body: ShowListView(shows: provider.searchShows.toList()),
      ),
    );
  }
}
