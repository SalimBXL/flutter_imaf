import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({this.friends});

  final List<dynamic> friends;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Users",
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.friends.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      trailing: Text(widget.friends[index]["activities"]),
                      title:
                          Text(widget.friends[index]["friend_id"].toString()),
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
