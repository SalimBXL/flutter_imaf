import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/networking.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> _friends;

  void initState() {
    super.initState();
  }

  void _getFriends() async {
    String address = "http://192.168.1.17:3000";
    int userId = 1;
    String url = "$address/users/$userId/friends";

    NetworkHelper networkHelper = NetworkHelper(url);
    var friends = await networkHelper.getData();
    setState(() {
      _friends = friends;
    });
  }

  @override
  Widget build(BuildContext context) {
    //_getFriends();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Users",
            ),
            FriendsList(friends: _friends),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getFriends,
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class FriendsList extends StatelessWidget {
  const FriendsList({
    Key key,
    @required List friends,
  })  : _friends = friends,
        super(key: key);

  final List _friends;

  @override
  Widget build(BuildContext context) {
    if (_friends != null) {
      return ListView.builder(
          itemCount: _friends.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Icon(Icons.person),
              trailing: Text(_friends[index]["activities"]),
              title: Text(_friends[index]["username"]),
            );
          });
    } else {
      return Text("empty");
    }
  }
}
