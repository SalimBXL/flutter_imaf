import 'package:flutter/material.dart';
import 'package:flutter_imaf/screens/home.dart';
import 'package:flutter_imaf/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<dynamic> friends;

  void getFriends() async {
    String address = "http://192.168.1.17:3000";
    int userId = 1;
    String url = "$address/users/$userId/friendships";

    NetworkHelper networkHelper = NetworkHelper(url);
    var friends = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home(
        friends: friends,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getFriends();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCircle(
              color: Colors.blueGrey,
              size: 100.0,
            ),
            Text("Retrieving friendlist..."),
          ],
        ),
      ),
    );
  }
}
