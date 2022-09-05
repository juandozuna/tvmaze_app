import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/useCases/get_episode_by_id_use_case.dart';
import 'package:tvmaze_app/presentation/providers/base_notifier_provider.dart';

class EpisodeProvider extends BaseNotifierProvider {
  final GetEpisodeByIdUseCase _getEpisodeByIdUseCase;

  EpisodeProvider(
    this._getEpisodeByIdUseCase,
  );

  int? episodeId;
  EpisodeEntity? episode;

  bool get hasEpisode => episode != null;

  void getEpisode(int id) async {
    episodeId = id;
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

  @override
  void resetProvider() {
    super.resetProvider();
    episodeId = null;
    episode = null;
  }
}
