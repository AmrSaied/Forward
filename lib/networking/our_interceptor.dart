import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class OurInterceptor extends InterceptorsWrapper {
  final _loggingTag = "DIO_TAG";

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept'] = "application/json";

    if (kDebugMode) {
      print('$_loggingTag-REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          '$_loggingTag-RESPONSE[${response.data}] => EXTRAS: ${response.extra}');
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          '$_loggingTag-ERROR[${err.error}] => MESSAGE: ${err.message}|| StackTrace: ${err.stackTrace}');
    }

    super.onError(err, handler);
  }
}
