import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/screens/friendship.dart';
import 'package:flutter_imaf/services/friendship.dart';
import 'package:flutter_imaf/services/user.dart';

enum Status { DRINK, SPORT, FUN, FOOD, MOVIE }
Map<Status, IconData> iconStatus = {
  Status.DRINK: Icons.emoji_food_beverage,
  Status.FOOD: Icons.restaurant,
  Status.SPORT: Icons.sports_tennis,
  Status.FUN: Icons.thermostat_rounded,
  Status.MOVIE: Icons.local_movies
};

class Home extends StatefulWidget {
  Home({this.user, this.friendships});

  final UserModel user;
  final FriendshipModel friendships;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _lastRefresh;

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              loggedUserPan(),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Friend List",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    "(Last refresh : $_lastRefresh)",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: widget.friendships.numberOfFriends(),
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: roundButton(),
                        trailing: Text("xx:xx"),
                        title: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.friendships.friendName(index: index),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.0,
                                color: Colors.black54,
                              ),
                            ),
                            activitiesIcons(
                                activities: widget.friendships
                                    .friendActivities(index: index)),
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
        backgroundColor: Colors.amberAccent,
        onPressed: () async {
          await widget.friendships.getData();
          updateUI();
        },
        tooltip: 'Refresh',
        child: Icon(
          Icons.refresh,
          color: Colors.black54,
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget activitiesIcons({List activities}) {
    activities.sort();
    List<Widget> iconList = [];

    double icoSize = 24.0;
    Color icoColor = Colors.grey.shade400;

    iconStatus.forEach((key, value) {
      String keyFormatted = key.toString().split(".").last;
      if (activities.contains(keyFormatted)) icoColor = Colors.black54;
      iconList.add(
        Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 2.0, top: 0.0, bottom: 0.0),
          child: Icon(
            value,
            size: icoSize,
            color: icoColor,
          ),
        ),
      );
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconList,
    );
  }

  Widget loggedUserPan() {
    return Container(
      color: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          widget.user.userName(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 36.0,
            color: Colors.white54,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget roundButton() {
    return Container(
      color: Colors.black54,
      child: IconButton(
          color: Colors.black54,
          splashColor: Colors.amberAccent,
          iconSize: 36,
          icon: Icon(
            Icons.person,
            color: Colors.white54,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Friendship();
            }));
          }),
    );
  }
}
