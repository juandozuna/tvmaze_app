import 'package:tvmaze_app/data/mappers/episode_mapper.dart';
import 'package:tvmaze_app/data/mappers/show_mapper.dart';
import 'package:tvmaze_app/data/services/show_service.dart';
import 'package:tvmaze_app/domain/entities/episode_entity.dart';
import 'package:tvmaze_app/domain/entities/season_entity.dart';
import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/extensions.dart';

class ShowDataRepository implements ShowRepository {
  final ShowService _showService;

  ShowDataRepository(this._showService);

  @override
  Future<Result<List<ShowEntity>>> getShows([int page = 0]) async {
    try {
      final data = await _showService.getShows(page);
      final mapped = ShowMapper.toEntityList(data);
      return Result.success(mapped);
    } catch (e) {
      final appError = e.toAppError();
      return Result.fail(appError);
    }
  }

  @override
  Future<Result<List<ShowEntity>>> getShowsByName(String name) async {
    try {
      final data = await _showService.getShowsByName(name);
      final showData = data.map((e) => e.show).toList();
      final mapped = ShowMapper.toEntityList(showData);
      return Result.success(mapped);
    } catch (e) {
      final appError = e.toAppError();
      return Result.fail(appError);
    }
  }

  @override
  Future<Result<ShowEntity>> getShowById(int id) async {
    try {
      final data = await _showService.getShowById(id);
      final mapped = ShowMapper.toEntity(data);
      return Result.success(mapped);
    } catch (e) {
      final appError = e.toAppError();
      return Result.fail(appError);
    }
  }

  @override
  Future<Result<List<SeasonEntity>>> getEpisodesForShow(int showId) async {
    try {
      final data = await _showService.getEpisodesForShow(showId);
      final mapped = EpisodeMapper.toEntityList(data);
      return Result.success(mapped);
    } catch (e) {
      final appError = e.toAppError();
      return Result.fail(appError);
    }
  }
}
