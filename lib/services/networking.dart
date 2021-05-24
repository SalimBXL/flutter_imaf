import 'dart:async';
import 'dart:io';
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
    //fetchData();
  }

  Future<Data> fetchData() async {
    String _address = 'users/$userId';
    Uri _uri = Uri.http(apiAddress, _address);
    try {
      final response = await http.get(_uri).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again later.');
        },
      );
      if (response.statusCode == 200) {
        return Data.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed');
      }
    } on SocketException {
      print("");
      throw Exception('Failed');
    }
  }
}
