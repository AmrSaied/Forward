import 'package:floward/data/repositories/post/post_repository.dart';
import 'package:floward/data/repositories/user/user_repository.dart';
import 'package:floward/presentation/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostRepository(Get.find()), fenix: true);
    Get.lazyPut(() => UserRepository(Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(Get.find(), Get.find()), fenix: true);
  }
}
