import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/domain/useCases/get_episodes_for_show_use_case.dart';
import 'package:tvmaze_app/domain/useCases/get_show_by_id_use_case.dart';
import 'package:tvmaze_app/presentation/models/model_mappers.dart';
import 'package:tvmaze_app/presentation/models/show_view_model.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';

class ShowDetailProvider extends BaseNotifierProvider {
  final GetShowByIdUseCase _getShowByIdUseCase;
  final GetEpisodesForShowUseCase _getEpisodesForShowUseCase;

  ShowDetailProvider(
    this._getShowByIdUseCase,
    this._getEpisodesForShowUseCase,
  );

  // State properties
  int? selectedShowId;
  ShowViewModel? selectedShow;
  List<SeasonEntity> seasons = [];

  // getters
  bool get hasShow => selectedShow != null;

  // Methods
  void getShow(int id) async {
    selectedShowId = id;
    notifyListeners();

    startLoading();

    final result = await _getShowByIdUseCase(id);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return;
    }

    final data = result.asSuccess.value;
    selectedShow = ModelMappers.fromShowEntity(data);
    stopLoading();
  }

  Future<List<SeasonEntity>> getEpisodesForShow() async {
    final result = await _getEpisodesForShowUseCase(selectedShowId!);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return [];
    }

    final data = result.asSuccess.value;
    seasons = data;
    return seasons;
  }

  @override
  void resetProvider() {
    super.resetProvider();
    selectedShowId = null;
    selectedShow = null;
    seasons = [];
  }
}
