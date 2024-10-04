import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// A singleton class for managing Dio instances for API calls.
///
/// This class initializes and configures a Dio instance with default settings
/// and provides methods for making HTTP requests.
class DioSingleton {
  // Private constructor for singleton pattern.
  DioSingleton._internal();

  // The single instance of the DioSingleton.
  static final DioSingleton _singleton = DioSingleton._internal();

  /// Returns the singleton instance of DioSingleton.
  static DioSingleton get instance => _singleton;

  /// The Dio instance used for making API requests.
  late Dio dio;

  /// The base URL for the API.
  final String baseUrl = 'https://unilevertcl.com/absence-api/public/api/';

  /// Creates and configures the Dio instance with provided API key.
  ///
  /// The [apiKey] is used for authorization headers.
  void create(final String apiKey) {
    final BaseOptions options = BaseOptions(
      headers: {
        'Authorization': apiKey,
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );

    dio = Dio(options);

    // Add logging interceptor in debug mode.
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: true,),
      );
    }
  }
}

/// Sends a POST request to the specified [path].
///
/// Optionally takes [data] and [cancelToken] parameters.
Future<Response<dynamic>> postHttp(
    final String path, {
      final Object? data,
      final CancelToken? cancelToken,
    }) =>
    DioSingleton.instance.dio.post(path, data: data, cancelToken: cancelToken);

/// Sends a PUT request to the specified [path].
///
/// Optionally takes [data] parameter.
Future<Response<dynamic>> putHttp(
    final String path, {
      final Object? data,
    }) =>
    DioSingleton.instance.dio.put(path, data: data);

/// Sends a PATCH request to the specified [path].
///
/// Optionally takes [data] parameter.
Future<Response<dynamic>> patchHttp(
    final String path, {
      final Object? data,
    }) =>
    DioSingleton.instance.dio.patch(path, data: data);

/// Sends a DELETE request to the specified [path].
///
/// Optionally takes [data] parameter.
Future<Response<dynamic>> deleteHttp(
    final String path, [
      final Object? data,
    ]) =>
    DioSingleton.instance.dio.delete(path, data: data);

/// Sends a GET request to the specified [path].
///
/// Optionally takes [cancelToken] parameter.
Future<Response<dynamic>> getHttp(
    final String path, {
      final CancelToken? cancelToken,
    }) =>
    DioSingleton.instance.dio.get(path, cancelToken: cancelToken);
