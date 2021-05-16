import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({this.friends});

  final List<dynamic> friends;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _lastRefresh =
      "${DateTime.now().hour.toString()}:${DateTime.now().minute.toString()}";

  @override
  void initState() {
    super.initState();
    print("***************");
    print(widget.friends);
    print("***************");
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
          children: <Widget>[
            Text(
              "Friend List",
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.friends.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.person),
                      trailing: Text(
                          widget.friends[index]["activities_list"].toString()),
                      title: Text(widget.friends[index]["friend"]["username"]
                          .toString()),
                    );
                  }),
            ),
            Text("Last refresh : $_lastRefresh"),
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
