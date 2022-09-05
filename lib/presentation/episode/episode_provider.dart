import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/useCases/get_episode_by_id_use_case.dart';
import 'package:tvmaze_app/presentation/models/model_mappers.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';

class EpisodeProvider extends BaseNotifierProvider {
  final GetEpisodeByIdUseCase _getEpisodeByIdUseCase;

  EpisodeProvider(
    this._getEpisodeByIdUseCase,
  );

  int? selectedEpisode;
  EpisodeEntity? episode;

  void getEpisode(int id) async {
    selectedEpisode = id;
    notifyListeners();

    startLoading();

    final result = await _getEpisodeByIdUseCase(id);

    if (result.isFailure) {
      setError(result.asFailure.error);
      return;
    }

    episode = result.asSuccess.value;
    stopLoading();
  }
}
