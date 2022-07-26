import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:provider/provider.dart';
import 'package:tvmaze_app/injector.dart';
import 'package:tvmaze_app/presentation/shows/shows_provider.dart';
import 'package:tvmaze_app/presentation/widgets/center_loading.dart';
import 'package:tvmaze_app/presentation/widgets/error_container.dart';
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
        body: Consumer<ShowsProvider>(
          builder: (ctx, value, child) {
            if (value.isLoading) {
              return const CenterLoading();
            }
            if (value.hasError) {
              return ErrorContainer(errorMessage: value.error!.toString());
            }
            final shows = value.searchShows.toList();
            return ShowListView(shows: shows);
          },
        ),
      ),
    );
  }
}
