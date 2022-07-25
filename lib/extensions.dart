import 'package:tvmaze_app/domain/error.dart';

extension ErrorMapper on Object {
  AppError toAppError() {
    return UnknownError(this);
  }
}
