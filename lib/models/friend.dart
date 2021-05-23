import 'package:flutter_imaf/models/user.dart';

class Friend extends User {
  final int id;
  final String username;
  final String updatedAt;
  final List<String> friendActivities;

  Friend({
    required this.id,
    required this.username,
    required this.updatedAt,
    required this.friendActivities,
  }) : super(
          id: id,
          username: username,
          updatedAt: updatedAt,
        );

  factory Friend.fromJson(Map<String, dynamic> json) {
    Friend _friend = Friend(
      id: json['id'],
      username: json['username'],
      updatedAt: json['updated_at'],
      friendActivities: List.from(json['friend_activities']),
    );
    return _friend;
  }
}
