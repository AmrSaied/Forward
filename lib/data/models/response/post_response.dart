import 'package:floward/data/models/base/base_response.dart';
import 'package:floward/data/models/ui_models/post.dart';

class PostResponse extends BaseResponse {
  final List<Post> postsList;

  PostResponse({required this.postsList});

  List toList() => postsList.map((e) => e.toMap()).toList();

  factory PostResponse.fromMap(dynamic map) => PostResponse(
        postsList: (map as List).map((e) {
          return Post.fromMap(e);
        }).toList(),
      );
}
