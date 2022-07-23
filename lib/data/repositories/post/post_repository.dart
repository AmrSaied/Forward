import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/response/post_response.dart';
import 'package:floward/data/repositories/base/base_repository.dart';
import 'package:floward/networking/networking_app_service.dart';

class PostRepository extends BaseRepository {
  final NetworkingAppService _networkingAppService;
  PostRepository(this._networkingAppService);

  Future<ApiStatus<PostResponse>> getAllPosts() async {
    final response = await _networkingAppService.getAllPosts();
    return parseResponseToStatus(
      response,
      () => PostResponse.fromMap(response.data),
    );
  }
}
