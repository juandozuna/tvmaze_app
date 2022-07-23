import 'package:equatable/equatable.dart';

abstract class AppError extends Equatable {
  @override
  List<Object> get props => [];
}

class UnknownError extends AppError {
  final dynamic error;

  UnknownError([this.error]);
}

class NetworkError extends AppError {
  final dynamic error;
  final int? statusCode;

  NetworkError([this.error, this.statusCode]);
}
