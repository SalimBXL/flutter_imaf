import 'dart:async';
import 'package:flutter_imaf/models/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/networking.dart';
import 'package:flutter_imaf/widgets/error_message.dart';
import 'package:flutter_imaf/widgets/progress_indicator.dart';
import 'package:flutter_imaf/widgets/show_button.dart';

import 'services/consts.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Data> futureData;
  late Networking networking;

  @override
  void initState() {
    super.initState();
    networking = Networking(
      userId: 1,
      apiAddress: "192.168.1.17:3000",
    );
    futureData = networking.fetchData();
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
          child: Center(
            child: FutureBuilder<Data>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return showButton(context: context, snapshot: snapshot);
                  } else if (snapshot.hasError) {
                    return errorMessage(snapshot: snapshot);
                  }
                  return progressIndicator();
                }),
          ),
        ),
      ),
    );
  }
}
