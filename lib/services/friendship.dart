import 'networking.dart';

class FriendshipModel {
  dynamic _apiDatas;
  String _address = "http://192.168.1.17:3000";

  FriendshipModel();

  int numberOfFriends() {
    return _apiDatas.length ?? 0;
  }

  String friendName({int index}) {
    return _apiDatas[index]["friend"]["username"] ?? "- - -";
  }

  List friendActivities({int index}) {
    return _apiDatas[index]["activities_list"] ?? "- - -";
  }

  void refreshFriendList() {
    getData();
  }

  Future<dynamic> getData() async {
    int userId = 1;

    String url = "$_address/users/$userId/friendships";
    NetworkHelper networkHelper = NetworkHelper(url);
    var friends = await networkHelper.getData();
    _apiDatas = friends;
    return _apiDatas;
  }
}
