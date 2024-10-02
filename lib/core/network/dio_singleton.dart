import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioSingleton {
  static final DioSingleton _singleton = DioSingleton._internal();

  DioSingleton._internal();

  static DioSingleton get instance => _singleton;
  late Dio dio;
  final String baseUrl = "http://unilevertcl.com/absence-api/public/api/";

  void create(String apiKey) {
    BaseOptions options = BaseOptions(
      headers: {
        "Authorization" : "$apiKey",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    }
  }
}


Future postHttp(String path, {dynamic data, CancelToken? cancelToken}) =>
    DioSingleton.instance.dio.post(path, data: data, cancelToken: cancelToken);

Future putHttp(String path, {dynamic data}) =>
    DioSingleton.instance.dio.put(path, data: data);

Future patchHttp(String path, {dynamic data}) =>
    DioSingleton.instance.dio.patch(path, data: data);

Future deleteHttp(String path, [dynamic data]) =>
    DioSingleton.instance.dio.delete(path);

Future getHttp(String path, {CancelToken? cancelToken}) async {
  try {
    DioSingleton.instance.dio.get(path, cancelToken: cancelToken);
  } on DioException catch(exception){
    throw Exception(exception.response?.data["message"] ?? "Something went wrong");

  } catch (exception){
    throw Exception("Something went wrong");
  }
}


