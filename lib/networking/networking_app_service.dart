import 'package:dio/dio.dart';
import 'package:floward/networking/constants.dart';
import 'package:floward/networking/mockup_utility.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

import 'dio_client.dart';

class NetworkingAppService extends GetxService {
  NetworkingAppService();

  Future<Response<dynamic>> getAllUsers() async {
    await MockupUtils.mockGetRequest(
      mockResponsePath: MockUpsPath.users,
      requestEndPoint: ApiConstants.users,
    );
    return DioClient.instance.get(ApiConstants.users);
  }

  Future<Response<dynamic>> getAllPosts() async {
    await MockupUtils.mockGetRequest(
      mockResponsePath: MockUpsPath.posts,
      requestEndPoint: ApiConstants.posts,
    );
    return DioClient.instance.get(ApiConstants.posts);
  }
}
