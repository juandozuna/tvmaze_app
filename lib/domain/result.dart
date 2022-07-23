import 'package:equatable/equatable.dart';
import 'package:tvmaze_app/domain/error.dart';

abstract class Result<T> {
  bool get isSuccess;

  bool get isFailure;

  SuccessResult<T> get asSuccess;

  FailureResult get asFailure;

  factory Result.success(T value) = SuccessResult;

  factory Result.fail(AppError error) = FailureResult;
}

class SuccessResult<T> extends Equatable implements Result<T> {
  final T value;

  @override
  bool get isSuccess => true;

  @override
  bool get isFailure => false;

  @override
  SuccessResult<T> get asSuccess => this;

  @override
  FailureResult get asFailure =>
      throw UnimplementedError('A SuccessResult is not a failure.');

  const SuccessResult(this.value);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [value];
}

class FailureResult<T> extends Equatable implements Result<T> {
  final AppError error;

  @override
  bool get isSuccess => false;

  @override
  bool get isFailure => true;

  @override
  SuccessResult<T> get asSuccess =>
      throw UnimplementedError('A FailureResult is not a success.');

  @override
  FailureResult get asFailure => this;

  const FailureResult(this.error);

  @override
  List<Object?> get props => [error];
}

class NoData extends Equatable {
  @override
  List<Object> get props => [];
}
