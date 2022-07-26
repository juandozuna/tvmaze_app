import 'package:flutter/material.dart';
import 'package:tvmaze_app/core/constants.dart';
import 'package:tvmaze_app/domain/useCases/get_shows_use_case.dart';
import 'package:tvmaze_app/domain/useCases/search_shows_by_name_use_case.dart';
import 'package:tvmaze_app/presentation/models/model_mappers.dart';
import 'package:tvmaze_app/presentation/models/single_show.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';
import 'package:tvmaze_app/presentation/routes/route.dart';

class ShowsProvider extends BaseNotifierProvider {
  final GetShowsUseCase _getShowsUseCase;
  final SearchShowsByNameUseCase _searchShowsByNameUseCase;
  final GlobalKey<NavigatorState> _navigatorKey;

  ShowsProvider(
    this._getShowsUseCase,
    this._searchShowsByNameUseCase,
    this._navigatorKey,
  );

  // State properties
  Set<SingleShow> shows = {};
  Set<SingleShow> searchShows = {};

  // Getters
  int get lastPage => (shows.last.id / showPageSize).round();

  // Methods
  Future<void> getShows() async {
    startLoading();
    final result = await _getShowsUseCase(0);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return;
    }

    final data = result.asSuccess.value;
    shows = data.map((s) => ModelMappers.fromShowEntity(s)).toSet();
    stopLoading();
  }

  Future<void> searchShowsByName(String name) async {
    startLoading();
    final result = await _searchShowsByNameUseCase(name);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return;
    }

    final data = result.asSuccess.value;
    searchShows = data.map((s) => ModelMappers.fromShowEntity(s)).toSet();
    stopLoading();

    _navigatorKey.currentState!.pushNamed(AppRoute.showsSearch);
  }

  void clearSearch() {
    searchShows = {};
  }
}
