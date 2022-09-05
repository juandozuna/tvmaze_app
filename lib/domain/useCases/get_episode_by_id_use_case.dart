import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/domain/use_case.dart';

class GetEpisodeByIdUseCase implements UseCaseAsync<EpisodeEntity, int> {
  final ShowRepository _showRepository;

  GetEpisodeByIdUseCase(this._showRepository);

  @override
  Future<Result<EpisodeEntity>> call(int episodeId) =>
      _showRepository.getEpisodeById(episodeId);
}
