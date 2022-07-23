import 'package:floward/data/models/base/api_status.dart';
import 'package:floward/data/models/response/user_response.dart';
import 'package:floward/data/repositories/base/base_repository.dart';
import 'package:floward/networking/networking_app_service.dart';

class UserRepository extends BaseRepository {
  final NetworkingAppService _networkingAppService;
  UserRepository(this._networkingAppService);

  Future<ApiStatus<UserResponse>> getAllUsers() async {
    final response = await _networkingAppService.getAllUsers();
    return parseResponseToStatus(
      response,
      () => UserResponse.fromMap(response.data),
    );
  }
}
