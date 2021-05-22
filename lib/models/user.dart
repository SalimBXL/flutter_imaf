class User {
  final int id;
  final String username;
  final String updatedAt;

  User({
    required this.id,
    required this.username,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    User _user = User(
      username: json['username'],
      id: json['id'],
      updatedAt: json['updated_at'],
    );
    return _user;
  }
}
