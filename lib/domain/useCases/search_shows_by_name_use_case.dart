import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/domain/use_case.dart';

class SearchShowsByNameUseCase
    implements UseCaseAsync<List<ShowEntity>, String> {
  final ShowRepository _repository;

  const SearchShowsByNameUseCase(this._repository);

  @override
  Future<Result<List<ShowEntity>>> call(String name) =>
      _repository.getShowsByName(name);
}
