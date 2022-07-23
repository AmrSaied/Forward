import 'package:floward/data/repositories/post/post_repository.dart';
import 'package:floward/data/repositories/user/user_repository.dart';
import 'package:floward/networking/constants.dart';
import 'package:floward/presentation/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../networking/dio_client.dart';
import '../../networking/networking_app_service.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    DioClient.instance = DioClient.getInstance();
    if (ApiConstants.environment == ENVIRONMENT.mockUp) {
      DioClient.dioAdapter = DioAdapter(dio: DioClient.dio!);
      DioClient.dio!.httpClientAdapter = DioClient.dioAdapter!;
    }
    Get.lazyPut(() => NetworkingAppService(), fenix: true);
    Get.lazyPut(() => PostRepository(Get.find()), fenix: true);
    Get.lazyPut(() => UserRepository(Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(Get.find(), Get.find()), fenix: true);
  }
}
