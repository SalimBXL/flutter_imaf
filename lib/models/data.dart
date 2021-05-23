import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/models/user.dart';

class Data {
  final User user;
  final List<Friendship> userFriendships;
  final List<String> userActivities;

  Data({
    required this.user,
    required this.userFriendships,
    required this.userActivities,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    List<Friendship> _friendships = [];
    List<dynamic> _jsonFriendships = List.from(json['friendships']);
    _jsonFriendships.forEach((jsonFriendship) {
      _friendships.add(Friendship.fromJson(jsonFriendship));
    });

    Data _data = Data(
      user: User.fromJson(json['user']),
      userFriendships: _friendships,
      userActivities: List.from(json['activities']),
    );
    return _data;
  }
}
