import 'package:tvmaze_app/data/mappers/show_mapper.dart';
import 'package:tvmaze_app/data/services/show_service.dart';
import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';

class ShowDataRepository implements ShowRepository {
  final ShowService _showService;

  ShowDataRepository(this._showService);

  @override
  Future<Result<List<ShowEntity>>> getShows([int page = 0]) async {
    final data = await _showService.getShows(page);
    final mapped = ShowMapper.toEntityList(data);
    return Result.success(mapped);
  }
}
