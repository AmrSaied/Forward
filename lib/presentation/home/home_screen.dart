import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:floward/data/models/base/ui_state_view_mixin.dart';
import 'package:floward/data/models/response/home_response.dart';
import 'package:floward/navigation/app_routes.dart';
import 'package:floward/presentation/home/home_controller.dart';
import 'package:floward/presentation/user_posts/user_posts_argument.dart';
import 'package:floward/styles/dimens.dart';
import 'package:floward/utils/home/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles/colors.dart';

class HomeScreen extends GetWidget<HomeController> with UiStateViewMixin {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => handleUiState<HomeResponse>(
          controller.homeUiState,
          (homeResponse) {
            return ListView.separated(
              itemCount: homeResponse.userResponse.usersList.length,
              separatorBuilder: (_, __) => SizedBox(height: Dimens.marginH8),
              itemBuilder: (_, index) {
                final user = homeResponse.userResponse.usersList[index];
                return InkWell(
                  onTap: () async {
                    final userPosts = homeResponse.postResponse.postsList
                        .userPosts(user.userId);
                    await Get.toNamed(
                      AppRoutes.userPostsRoute,
                      arguments: UserPostArgument(
                        user: user,
                        userPosts: userPosts,
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(Dimens.marginH8),
                    padding: EdgeInsets.all(Dimens.marginH8),
                    decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      borderRadius: BorderRadius.circular(
                        Dimens.radiusMedium,
                      ),
                    ),
                    child: ListTile(
                      leading: CircularProfileAvatar(
                        user.thumbnailUrl,
                        radius: Dimens.radiusRounded,
                      ),
                      title: Text(user.name),
                      subtitle: Text(
                        homeResponse.postResponse.postsList
                            .userPostsCount(user.userId)
                            .toString(),
                      ),
                      trailing: const Icon(Icons.arrow_right),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
