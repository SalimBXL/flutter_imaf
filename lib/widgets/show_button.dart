import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/consts.dart';

// void openMainScreen(
//     {required BuildContext context, required AsyncSnapshot snapshot}) {
//   // Navigator.push(context, MaterialPageRoute(
//   //   builder: (context) {
//   //     return Home(
//   //       user: snapshot.data!.user,
//   //       friendships: snapshot.data!.userFriendships,
//   //       userActivities: snapshot.data!.userActivities,
//   //     );
//     },
//   ));
// }

Widget showButton({
  required BuildContext context,
  required AsyncSnapshot snapshot,
}) {
  return ElevatedButton(
    autofocus: true,
    child: Text(
      "SHOW",
      style: TextStyle(
        color: AMBER_ACCENT,
      ),
    ),
    onPressed: () {
      //openMainScreen(context: context, snapshot: snapshot);
    },
  );
}
