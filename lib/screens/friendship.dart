import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/friendship.dart';
import 'package:flutter_imaf/widgets/activities_icons.dart';

class Friendship extends StatefulWidget {
  Friendship({this.friendIndex, this.friendshipModel});

  final int friendIndex;
  final FriendshipModel friendshipModel;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                  widget.friendshipModel.friendName(index: widget.friendIndex),
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  )),
            ),
            Row(
              children: [
                Text("Nickname : "),
                Text(widget.friendshipModel
                    .friendName(index: widget.friendIndex))
              ],
            ),
            Row(
              children: [
                Text("Email : "),
                Text(widget.friendshipModel
                    .friendEmail(index: widget.friendIndex))
              ],
            ),
            ActivitiesIcons(
                activities: widget.friendshipModel
                    .friendActivities(index: widget.friendIndex),
                icoSize: 48),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
