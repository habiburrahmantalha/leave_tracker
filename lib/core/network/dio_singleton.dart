import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;
  late Dio dio;
  final String baseUrl = 'https://unilevertcl.com/absence-api/public/api/';

  void create(final String apiKey) {
    final BaseOptions options = BaseOptions(
      headers: {
        'Authorization' : apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,
      ));
    }
  }
}


Future<Response<dynamic>> postHttp(final String path, {final Object? data, final CancelToken? cancelToken}) =>
    DioSingleton.instance.dio.post(path, data: data, cancelToken: cancelToken);

Future<Response<dynamic>> putHttp(final String path, {final Object? data}) =>
    DioSingleton.instance.dio.put(path, data: data);

Future<Response<dynamic>> patchHttp(final String path, {final Object? data}) =>
    DioSingleton.instance.dio.patch(path, data: data);

Future<Response<dynamic>> deleteHttp(final String path, [final data]) =>
    DioSingleton.instance.dio.delete(path);

Future<Response<dynamic>> getHttp(final String path, {final CancelToken? cancelToken}) =>
    DioSingleton.instance.dio.get(path, cancelToken: cancelToken);



