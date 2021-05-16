import 'networking.dart';

class UserModel {
  dynamic _apiDatas;
  String _address = "http://192.168.1.17:3000";

  UserModel();

  String userName() => _apiDatas["username"] ?? "";
  String email() => _apiDatas["email"] ?? "";
  String id() => _apiDatas["id"] ?? "";
  String lastUpdate() => _apiDatas["updated_at"] ?? "";

  void refreshMyDatas() {
    getData();
  }

  Future<dynamic> getData() async {
    int userId = 1;
    String url = "$_address/users/$userId";
    NetworkHelper networkHelper = NetworkHelper(url);
    _apiDatas = await networkHelper.getData();
    return _apiDatas;
  }
}
