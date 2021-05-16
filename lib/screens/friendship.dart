import 'package:flutter/material.dart';

class Friendship extends StatefulWidget {
  Friendship();

  @override
  _FriendshipState createState() => _FriendshipState();
}

class _FriendshipState extends State<Friendship> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(
          "I Am Available For...",
          style: TextStyle(
            color: Colors.white54,
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: Center(),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
