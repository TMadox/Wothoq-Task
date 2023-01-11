import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wothoq_task/misc/bindings.dart';

class DioService {
  final Dio _dio = Dio();
  static DioService get to => locator.get();
  DioService() {
    if (!kReleaseMode) {
      _dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestHeader: true,
          requestBody: true,
        ),
      );
    }
    _dio.options.baseUrl = "https://run.mocky.io/v3/";
    _dio.options.headers.addAll(
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
    );
  }

  Future<T?> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? extra,
      Map<String, dynamic>? headers,
      onReceiveProgress}) async {
    queryParameters ??= {};
    Response<T> res = await _dio.get<T>(
      path,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    if (res.statusCode == 401) {}
    return res.data;
  }

  Future<T?> delete<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final res = await _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T?> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    Response<T> res;
    res = await _dio.post<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }

  Future<T?> put<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    onSendProgress,
    onReceiveProgress,
  }) async {
    final res = await _dio.put<T>(
      path,
      data: data,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        extra: extra,
      ),
    );
    return res.data;
  }
}
