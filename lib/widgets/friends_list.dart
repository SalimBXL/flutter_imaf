import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/data.dart';
import 'package:flutter_imaf/widgets/list_tile.dart';

Widget friendsList({required AsyncSnapshot<Data> snapshot}) {
  return Expanded(
    child: ListView.builder(
        itemCount: snapshot.data!.userFriendships.length,
        itemBuilder: (BuildContext context, int index) {
          return listTile(friendship: snapshot.data!.userFriendships[index]);
        }),
  );
}
