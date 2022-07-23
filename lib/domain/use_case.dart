import 'package:equatable/equatable.dart';
import 'package:tvmaze_app/domain/result.dart';

abstract class UseCaseAsync<Type, Params> {
  Future<Result<Type>> call(Params params);
}

abstract class UseCase<Type, Params> {
  Result<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
