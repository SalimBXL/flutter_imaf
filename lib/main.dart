import 'dart:async';
import 'dart:convert';
import 'package:flutter_imaf/models/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/screens/home.dart';
import 'package:http/http.dart' as http;

Future<Data> fetchData({required int userId}) async {
  final response = await http
      .get(Uri.http('192.168.1.17:3000', 'users/$userId/friendships'));
  if (response.statusCode == 200) {
    Data _data = Data.fromJson(jsonDecode(response.body));
    return _data;
  } else {
    throw Exception('Failed to load friendship');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData(userId: 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Data>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ElevatedButton(
                    child: Text("SHOW"),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Home(
                            user: snapshot.data!.user,
                            friendships: snapshot.data!.friendships,
                          );
                        },
                      ));
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                // By default, show a loading spinner.
                return Column(
                  children: [
                    Text("Loading"),
                    CircularProgressIndicator(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
