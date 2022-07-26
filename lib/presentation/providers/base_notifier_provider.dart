import 'package:flutter/foundation.dart';
import 'package:tvmaze_app/domain/error.dart';

abstract class BaseNotifierProvider with ChangeNotifier {
  bool isInitialLoad = true;
  bool isLoading = false;
  AppError? error;

  bool get hasError => error != null;

  void startLoading([bool notify = true]) {
    isLoading = true;
    clearError(false);
    if (notify) notifyListeners();
  }

  void stopLoading([bool notify = true]) {
    isLoading = false;
    isInitialLoad = false;
    if (notify) notifyListeners();
  }

  void setError(AppError error, [bool notify = true]) {
    this.error = error;
    stopLoading(false);
    if (notify) notifyListeners();
  }

  void clearError([bool notify = true]) {
    error = null;
    if (notify) notifyListeners();
  }

  void setTimeoutError(
    AppError error, [
    Duration duration = const Duration(seconds: 5),
  ]) {
    setError(error);
    Future.delayed(duration, clearError);
  }

  void resetProvider() {
    isInitialLoad = true;
    isLoading = false;
    error = null;
  }
}
