import 'package:floward/data/models/base/base_response.dart';
import 'package:floward/data/models/response/post_response.dart';
import 'package:floward/data/models/response/user_response.dart';

class HomeResponse extends BaseResponse {
  final PostResponse postResponse;
  final UserResponse userResponse;
  HomeResponse({
    required this.postResponse,
    required this.userResponse,
  });
}
