import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_imaf/models/data.dart';

class Networking {
  final int userId;
  late final Data data;
  final String apiAddress;

  Networking({
    required this.userId,
    required this.apiAddress,
  }) {
    fetchData();
  }

  Future<Data> fetchData() async {
    String _address = 'users/$userId';
    Uri _uri = Uri.http(apiAddress, _address);
    final response = await http.get(_uri);

    if (response.statusCode == 200) {
      return Data.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load friendship');
    }
  }
}
