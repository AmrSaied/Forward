import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/response/user_response.dart';
import 'package:floward/data/repositories/base/base_repository.dart';
import 'package:floward/main.dart';
import 'package:floward/networking/constants.dart';
import 'package:floward/networking/networking_app_service.dart';

class UserRepository extends BaseRepository {
  final NetworkingAppService _networkingAppService;
  UserRepository(this._networkingAppService);

  Stream<ApiStatus<UserResponse>> getAllUsers() async* {
    if (cacheStorage.hasData(CacheStorageKeys.users)) {
      final cachedUsersResponse = UserResponse.fromMap(
        cacheStorage.read(CacheStorageKeys.users)!,
      );
      yield ApiStatus.success(cachedUsersResponse);
    }
    final response = await _networkingAppService.getAllUsers();
    final apiStatus = parseResponseToStatus<UserResponse>(
      response,
      () => UserResponse.fromMap(
        response.data,
      ),
    );
    if (apiStatus.status.runtimeType == SuccessStatus) {
      await cacheStorage.write(
        CacheStorageKeys.users,
        apiStatus.data!.toList(),
      );
    }
    yield apiStatus;
  }
}
