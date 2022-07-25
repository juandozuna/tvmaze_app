import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/result.dart';

abstract class ShowRepository {
  Future<Result<List<ShowEntity>>> getShows([int page = 0]);

  Future<Result<List<ShowEntity>>> getShowsByName(String name);
}
