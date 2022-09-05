import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/result.dart';

abstract class ShowRepository {
  Future<Result<List<ShowEntity>>> getShows([int page = 0]);

  Future<Result<List<ShowEntity>>> getShowsByName(String name);

  Future<Result<ShowEntity>> getShowById(int id);

  Future<Result<List<SeasonEntity>>> getEpisodesForShow(int showId);

  Future<Result<EpisodeEntity>> getEpisodeById(int id);
}
