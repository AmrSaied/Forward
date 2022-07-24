import 'dart:async';

import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/base/ui_state.dart';
import 'package:floward/data/models/base/ui_state_controller_mixin.dart';
import 'package:floward/data/models/response/home_response.dart';
import 'package:floward/data/models/response/post_response.dart';
import 'package:floward/data/models/response/user_response.dart';
import 'package:floward/data/repositories/post/post_repository.dart';
import 'package:floward/data/repositories/user/user_repository.dart';
import 'package:floward/utils/home/extensions.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with UiStateControllerMixin {
  final UserRepository _userRepository;
  final PostRepository _postRepository;
  HomeController(
    this._postRepository,
    this._userRepository,
  );

  StreamSubscription? _usersSubscription;
  StreamSubscription? _postsSubscription;

  final usersUiState = Rx<UiState<UserResponse>>(UiState.idle());
  final postsUiState = Rx<UiState<PostResponse>>(UiState.idle());
  final homeUiState = Rx<UiState<HomeResponse>>(UiState.idle());

  void _updateUserUiState(ApiStatus<UserResponse> responseStatus) {
    final uiState = mapToUiState<UserResponse>(responseStatus);
    usersUiState.value = uiState;
  }

  void _updatePostsUiState(ApiStatus<PostResponse> responseStatus) {
    final uiState = mapToUiState<PostResponse>(responseStatus);
    postsUiState.value = uiState;
  }

  void _getAllUsers() => _usersSubscription =
      _userRepository.getAllUsers().listen(_updateUserUiState);

  void _getAllPosts() => _postsSubscription =
      _postRepository.getAllPosts().listen(_updatePostsUiState);

  void _fetchData() {
    homeUiState.value = UiState.loading();
    _getAllUsers();
    _getAllPosts();
  }

  void _onUserUiStateChanged(UiState<UserResponse> usersUiState) =>
      homeUiState.value = mapToHomeUiState(usersUiState, postsUiState.value);

  void _onPostsUiStateChanged(UiState<PostResponse> postsUiState) =>
      homeUiState.value = mapToHomeUiState(usersUiState.value, postsUiState);

  @override
  void onInit() {
    _fetchData();
    ever(usersUiState, _onUserUiStateChanged);
    ever(postsUiState, _onPostsUiStateChanged);
    super.onInit();
  }

  @override
  void onClose() {
    _usersSubscription?.cancel();
    _postsSubscription?.cancel();
    super.onClose();
  }
}
