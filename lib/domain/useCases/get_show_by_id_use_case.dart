import 'package:tvmaze_app/domain/entities/show_entity.dart';
import 'package:tvmaze_app/domain/repositories/show_repository.dart';
import 'package:tvmaze_app/domain/result.dart';
import 'package:tvmaze_app/domain/use_case.dart';

class GetShowByIdUseCase implements UseCaseAsync<ShowEntity, int> {
  final ShowRepository _showRepository;

  const GetShowByIdUseCase(this._showRepository);

  @override
  Future<Result<ShowEntity>> call(int id) => _showRepository.getShowById(id);
}
