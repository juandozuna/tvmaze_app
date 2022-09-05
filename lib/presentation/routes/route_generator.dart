import 'package:flutter/material.dart';
import 'package:tvmaze_app/presentation/episode/episode_page.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';
import 'package:tvmaze_app/presentation/show_detail/show_detail_page.dart';
import 'package:tvmaze_app/presentation/shows/show_search_page.dart';
import 'package:tvmaze_app/presentation/shows/shows_page.dart';
import 'package:tvmaze_app/presentation/splash_screen/splash_screen_page.dart';

class RouteGenerator {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoute.splashScreen: (context) => const SplashScreenPage(),
    AppRoute.shows: (_) => const ShowsPage(),
    AppRoute.showsSearch: (_) => const ShowSearchPage(),
    AppRoute.showDetails: (_) => const ShowDetailPage(),
    AppRoute.episode: (_) => const EpisodePage()
  };
}
