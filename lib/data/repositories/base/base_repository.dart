import 'dart:io';

import 'package:dio/dio.dart';
import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/base/base_response.dart';

class BaseRepository {
  ApiStatus<T> parseResponseToStatus<T extends BaseResponse>(
    Response<dynamic> response,
    T Function() creator,
  ) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        {
          // final data = BaseResponse.fromJson({response.data});
          // if (data.statusCode == HttpStatus.ok) {
          return ApiStatus.success(creator());
          // } else {
          //   return ApiStatus.error(
          //     message: data.responseException?.exceptionMessage,
          //   );
          // }
        }
      case HttpStatus.badRequest:
        return ApiStatus.error();
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        return ApiStatus.unAuthorized();
      case HttpStatus.internalServerError:
        return ApiStatus.error();
      default:
        return ApiStatus.error();
    }
  }
}
