import 'package:flutter/material.dart';
import 'package:flutter_imaf/screens/home.dart';
import 'package:flutter_imaf/services/friendship.dart';
import 'package:flutter_imaf/services/user.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<dynamic> friends;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    UserModel user = UserModel();
    await user.getData();
    FriendshipModel friendship = FriendshipModel();
    await friendship.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Home(
        user: user,
        friendships: friendship,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
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
