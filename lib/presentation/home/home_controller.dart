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

  final homeUiState = Rx<UiState<HomeResponse>>(UiState.idle());

  Future<UiState<UserResponse>> _getAllUsers() async {
    final responseStatus = await _userRepository.getAllUsers();
    final uiState = mapToUiState<UserResponse>(responseStatus);
    return uiState;
  }

  Future<UiState<PostResponse>> _getAllPosts() async {
    final responseStatus = await _postRepository.getAllPosts();
    final uiState = mapToUiState<PostResponse>(responseStatus);
    return uiState;
  }

  Future<void> _fetchData() async {
    homeUiState.value = UiState.loading();
    final userUiState = await _getAllUsers();
    final postUiState = await _getAllPosts();
    homeUiState.value = mapToHomeUiState(userUiState, postUiState);
  }

  @override
  void onInit() async {
    await _fetchData();
    super.onInit();
  }
}
