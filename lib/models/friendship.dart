import 'package:flutter_imaf/models/friend.dart';

class Friendship {
  final int id;
  final Friend friend;
  final List<String> activities;
  final String updatedAt;

  Friendship({
    required this.id,
    required this.friend,
    required this.activities,
    required this.updatedAt,
  });

  factory Friendship.fromJson(Map<String, dynamic> json) {
    Friendship _friendship = Friendship(
      id: json['id'],
      friend: Friend.fromJson(json['friend']),
      activities: List.from(json['activities']),
      updatedAt: json['updated_at'],
    );
    return _friendship;
  }
}
