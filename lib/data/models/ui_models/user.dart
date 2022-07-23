class User {
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;

//<editor-fold desc="Data Methods">

  const User({
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          name == other.name &&
          url == other.url &&
          thumbnailUrl == other.thumbnailUrl);

  @override
  int get hashCode =>
      userId.hashCode ^ name.hashCode ^ url.hashCode ^ thumbnailUrl.hashCode;

  @override
  String toString() {
    return 'User{  userId: $userId, name: $name, url: $url, thumbnailUrl: $thumbnailUrl,}';
  }

  User copyWith({
    int? userId,
    String? name,
    String? url,
    String? thumbnailUrl,
  }) {
    return User(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as int,
      name: map['name'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

//</editor-fold>
}
