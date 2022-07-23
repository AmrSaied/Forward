import 'package:floward/data/models/ui_models/post.dart';
import 'package:floward/data/models/ui_models/user.dart';

class UserPostArgument {
  final User user;
  final List<Post> userPosts;
  UserPostArgument({
    required this.user,
    required this.userPosts,
  });

  Map<String, dynamic> toMap() {
    return {
      'user': user,
      'userPosts': userPosts.map((e) => e.toMap()).toList(),
    };
  }

  factory UserPostArgument.fromMap(Map<String, dynamic> map) {
    return UserPostArgument(
      user: User.fromMap(map['user']),
      userPosts:
          (map['userPosts'] as List).map((e) => Post.fromMap(e)).toList(),
    );
  }
}
