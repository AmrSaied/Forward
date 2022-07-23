import 'package:floward/data/models/base/base_response.dart';

import '../ui_models/user.dart';

class UserResponse extends BaseResponse {
  final List<User> usersList;

  UserResponse({required this.usersList});

  Map<String, dynamic> toMap() => {
        'usersList': usersList.map((e) => e.toMap()).toList(),
      };

  factory UserResponse.fromMap(dynamic map) => UserResponse(
        usersList: (map as List).map((e) {
          return User.fromMap(e);
        }).toList(),
      );
}
