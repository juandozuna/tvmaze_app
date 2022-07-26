import 'package:dio/dio.dart';
import 'package:tvmaze_app/core/constants.dart';

Dio createDioClient() {
  final options = BaseOptions(
    baseUrl: baseApiEndpoint,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  final dio = Dio(options);

  dio.interceptors.add(LogInterceptor(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
  ));

  return dio;
}
