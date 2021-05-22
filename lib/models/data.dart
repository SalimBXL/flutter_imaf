import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/models/user.dart';

class Data {
  final User user;
  final List<Friendship> friendships;

  Data({
    required this.user,
    required this.friendships,
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
    );
    return _data;
  }
}
