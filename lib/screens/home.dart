import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/models/user.dart';
import 'package:flutter_imaf/services/consts.dart';
import 'package:flutter_imaf/widgets/activities_icons.dart';
import 'package:flutter_imaf/widgets/logged_user_pan.dart';

class Home extends StatefulWidget {
  Home({
    required this.user,
    required this.friendships,
    required this.activities,
  });

  final User user;
  final List<Friendship> friendships;
  final List<String> activities;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _lastRefresh;

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI() {
    setState(() {
      _lastRefresh =
          "${(DateTime.now().hour) < 10 ? "0" : ""}${DateTime.now().hour}"
          ":${(DateTime.now().minute) < 10 ? "0" : ""}${DateTime.now().minute}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_activity),
        backgroundColor: BLACK54,
        title: Text(
          "I Am Available For...",
          style: TextStyle(
            color: WHITE54,
          ),
        ),
      ),
      body: Container(
        color: FADE,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              loggedUserPan(user: widget.user, activities: widget.activities),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Friend List",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: BLACK54,
                    ),
                  ),
                  Text(
                    "(Last refresh : $_lastRefresh)",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                      color: BLACK54,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.friendships.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        //leading: roundButton(friendIndex: index),
                        trailing: Text(
                          "xx:xx",
                          style: TextStyle(
                            color: GREY_ACCENT,
                          ),
                        ),
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.friendships[index].friend.username,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                                color: GREY_ACCENT,
                              ),
                            ),
                            activitiesIcons(
                                activities:
                                    widget.friendships[index].activities),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AMBER_ACCENT,
        onPressed: () {
          updateUI();
        },
        tooltip: 'Refresh',
        child: Icon(
          Icons.refresh,
          color: GREY_ACCENT,
        ),
      ),
    );
  }

  // Widget roundButton({int friendIndex}) {
  //   return Container(
  //     color: Colors.black54,
  //     child: IconButton(
  //         color: Colors.black54,
  //         splashColor: Colors.amberAccent,
  //         iconSize: 36,
  //         icon: Icon(
  //           Icons.person,
  //           color: Colors.white54,
  //         ),
  //         onPressed: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return Friendship(
  //               friendIndex: friendIndex,
  //               friendshipModel: widget.friendships,
  //             );
  //           }));
  //         }),
  //   );
  // }

}
