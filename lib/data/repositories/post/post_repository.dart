import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/response/post_response.dart';
import 'package:floward/data/repositories/base/base_repository.dart';
import 'package:floward/main.dart';
import 'package:floward/networking/constants.dart';
import 'package:floward/networking/networking_app_service.dart';

class PostRepository extends BaseRepository {
  final NetworkingAppService _networkingAppService;
  PostRepository(this._networkingAppService);

  Stream<ApiStatus<PostResponse>> getAllPosts() async* {
    if (cacheStorage.hasData(CacheStorageKeys.posts)) {
      final cachedPostsResponse = PostResponse.fromMap(
        cacheStorage.read(CacheStorageKeys.posts)!,
      );
      yield ApiStatus.success(cachedPostsResponse);
    }
    final response = await _networkingAppService.getAllPosts();
    final apiStatus = parseResponseToStatus(
      response,
      () => PostResponse.fromMap(response.data),
    );
    if (apiStatus.status.runtimeType == SuccessStatus) {
      await cacheStorage.write(
        CacheStorageKeys.posts,
        apiStatus.data!.toList(),
      );
    }
    yield apiStatus;
  }
}
