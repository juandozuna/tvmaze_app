import 'package:tvmaze_app/core/constants.dart';
import 'package:tvmaze_app/domain/useCases/get_shows_use_case.dart';
import 'package:tvmaze_app/presentation/models/single_show.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';

class ShowsProvider extends BaseNotifierProvider {
  final GetShowsUseCase _getShowsUseCase;

  ShowsProvider(this._getShowsUseCase);

  // State properties
  Set<SingleShow> shows = {};

  // Getters
  int get lastPage => (shows.last.id / showPageSize).round();

  // Methods
  Future<void> getShows() async {
    final result = await _getShowsUseCase(0);

    if (result.isFailure) {}
  }
}
