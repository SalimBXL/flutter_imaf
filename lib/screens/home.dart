import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/friendship.dart';
import 'package:flutter_imaf/services/user.dart';

class Home extends StatefulWidget {
  Home({this.user, this.friendships});

  final UserModel user;
  final FriendshipModel friendships;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _lastRefresh() {
    return "${(DateTime.now().hour) < 10 ? "0" : ""}${DateTime.now().hour}"
        ":${(DateTime.now().minute) < 10 ? "0" : ""}${DateTime.now().minute}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("I Am Available For..."),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              widget.user.userName(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Friend List",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "(Last refresh : ${_lastRefresh()})",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.friendships.numberOfFriends(),
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      trailing: Text(
                        widget.friendships
                            .friendActivities(index: index)
                            .toString(),
                      ),
                      title: Text(
                        widget.friendships.friendName(index: index),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
