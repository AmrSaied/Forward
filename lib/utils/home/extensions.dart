import 'package:floward/data/models/base/ui_state.dart';
import 'package:floward/data/models/response/home_response.dart';
import 'package:floward/data/models/response/user_response.dart';
import 'package:floward/presentation/home/home_controller.dart';

import '../../data/models/response/post_response.dart';
import '../../data/models/ui_models/post.dart';

extension HomeControllerX on HomeController {
  UiState<HomeResponse> mapToHomeUiState(
    UiState<UserResponse> userUiState,
    UiState<PostResponse> postUiState,
  ) {
    if (userUiState.isSuccess && postUiState.isSuccess) {
      return UiState.success(
        HomeResponse(
          userResponse: userUiState.data!,
          postResponse: postUiState.data!,
        ),
      );
    } else if (userUiState.isError) {
      return UiState.error(userUiState.message);
    } else if (postUiState.isError) {
      return UiState.error(postUiState.message);
    } else if (userUiState.isNoInternet || postUiState.isNoInternet) {
      return UiState.noInternet();
    } else if (userUiState.isNoData || postUiState.isNoData) {
      return UiState.noData();
    } else if (userUiState.isServerError || postUiState.isServerError) {
      return UiState.serverError("Server Error");
    } else {
      return UiState.idle();
    }
  }
}

extension HomeX on List<Post> {
  List<Post> userPosts(int userId) =>
      where((post) => post.userId == userId).toList();

  int userPostsCount(int userId) => userPosts(userId).length;
}
