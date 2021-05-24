import 'dart:async';
import 'package:flutter_imaf/models/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/models/user.dart';
import 'package:flutter_imaf/services/networking.dart';
import 'package:flutter_imaf/widgets/error_message.dart';
import 'package:flutter_imaf/widgets/friends_list.dart';
import 'package:flutter_imaf/widgets/friends_list_title.dart';
import 'package:flutter_imaf/widgets/progress_indicator.dart';
import 'package:flutter_imaf/services/consts.dart';
import 'package:flutter_imaf/widgets/logged_user_pan.dart';
import 'services/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  late final User user;
  late final List<Friendship> friendships;
  late final List<String> userActivities;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _lastRefresh;
  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();

    updateUI();
  }

  void updateUI() {
    setState(() {
      Networking networking = Networking(
        userId: 1,
        apiAddress: API_ADDRESS,
      );
      futureData = networking.fetchData();
      _lastRefresh =
          "${(DateTime.now().hour) < 10 ? "0" : ""}${DateTime.now().hour}"
          ":${(DateTime.now().minute) < 10 ? "0" : ""}${DateTime.now().minute}";
    });
  }

  Widget buildPage() {
    return Center(
      child: FutureBuilder<Data>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  loggedUserPan(
                      user: snapshot.data!.user,
                      activities: snapshot.data!.userActivities),
                  friendsListTitle(
                    lastRefresh: _lastRefresh,
                  ),
                  friendsList(
                    snapshot: snapshot,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return errorMessage(snapshot: snapshot);
            }
            return progressIndicator();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Scaffold(
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
          child: buildPage(),
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
      ),
    );
  }
}
