import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/domain/use_case.dart';

class GetShowsUseCase implements UseCaseAsync<List<ShowEntity>, int> {
  final ShowRepository _repository;

  const GetShowsUseCase(this._repository);

  @override
  Future<Result<List<ShowEntity>>> call(int page) => _repository.getShows(page);
}
