import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:floward/networking/constants.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'our_interceptor.dart';

class DioClient {
  static Dio? dio;
  static DioAdapter? dioAdapter;
  static Dio instance = getInstance();
  static Dio getInstance() {
    if (dio != null) return dio!;
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
    dio?.interceptors.add(LogInterceptor());
    dio?.interceptors.add(OurInterceptor());
    if (ApiConstants.enableMockUp) {
      dioAdapter = DioAdapter(dio: dio!);
      dio!.httpClientAdapter = dioAdapter!;
    }
    dio?.interceptors.add(
      DioCacheManager(CacheConfig(
        baseUrl: ApiConstants.baseUrl,
      )).interceptor,
    );
    return dio!;
  }
}
