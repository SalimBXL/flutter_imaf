import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/models/user.dart';

class Data {
  final User user;
  final List<Friendship> friendships;
  final List<String> activities;

  Data({
    required this.user,
    required this.friendships,
    required this.activities,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Friendship> _friendships = [];
    List<dynamic> _jsonFriendships = List.from(json['friendships']);
    _jsonFriendships.forEach((jsonFriendship) {
      Friendship friendshipToAdd = Friendship.fromJson(jsonFriendship);
      _friendships.add(friendshipToAdd);
    });

    Data _data = Data(
      user: User.fromJson(json['user']),
      friendships: _friendships,
      activities: List.from(json['activities']),
    );
    return _data;
  }
}
