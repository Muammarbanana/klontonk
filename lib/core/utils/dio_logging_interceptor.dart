import 'dart:developer';

import 'package:dio/dio.dart';

class DioLoggingInterceptor extends InterceptorsWrapper {
  @override
  Future<dynamic> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    log('options data: ${options.data}');
    log('options headers : ${options.headers}');
    log('options query param: ${options.queryParameters}');

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    log('<-- ${response.statusCode} ${response.requestOptions.baseUrl + response.requestOptions.path}');
    handler.next(response);
  }

  @override
  Future<dynamic> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    log('<-- ${err.message} ${err.response?.requestOptions != null ? ((err.response?.requestOptions.baseUrl ?? '') + (err.response?.requestOptions.path ?? '')) : 'URL'}');
    final responseCode = err.response?.statusCode;
    log('<-- response data = ${err.response?.data}');
    log('<-- response code = $responseCode');
    handler.next(err);
  }
}
