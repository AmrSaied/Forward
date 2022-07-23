import 'package:floward/binding/home_binding.dart';
import 'package:floward/navigation/app_routes.dart';
import 'package:floward/presentation/home/home_screen.dart';
import 'package:floward/presentation/user_posts/user_posts_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static const initial = AppRoutes.homeRoute;

  static final routes = [
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.userPostsRoute,
      page: () => const UserPostsScreen(),
    ),
  ];
}
