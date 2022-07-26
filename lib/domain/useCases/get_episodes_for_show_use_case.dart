import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/domain/use_case.dart';

class GetEpisodesForShowUseCase
    implements UseCaseAsync<List<SeasonEntity>, int> {
  final ShowRepository _showRepository;

  GetEpisodesForShowUseCase(this._showRepository);

  @override
  Future<Result<List<SeasonEntity>>> call(int showId) =>
      _showRepository.getEpisodesForShow(showId);
}
