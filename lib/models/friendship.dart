import 'package:flutter_imaf/models/user.dart';

class Friendship {
  final int id;
  final User friend;
  final List<String> activities;

  Friendship({
    required this.id,
    required this.friend,
    required this.activities,
  });

  factory Friendship.fromJson(Map<String, dynamic> json) {
    Friendship _friendship = Friendship(
      id: json['id'],
      friend: User.fromJson(json['friend']),
      activities: List.from(json['activities']),
    );
    return _friendship;
  }
}
