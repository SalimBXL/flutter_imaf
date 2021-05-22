import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/services/consts.dart';
import 'package:flutter_imaf/widgets/activities_icons.dart';

Widget trailing({required Friendship friendship}) {
  return Container(
    color: GREY_ACCENT,
    child: activitiesIcons(
        activities: friendship.activities,
        invertColors: true,
        showOnlyActives: true),
  );
}

Widget leading({required Friendship friendship}) {
  return Text(
    friendship.friend.username,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18.0,
      color: GREY_ACCENT,
    ),
  );
}

Widget listTile({required Friendship friendship}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: leading(friendship: friendship),
        ),
        Expanded(
          child: trailing(friendship: friendship),
        ),
        activitiesIcons(activities: friendship.activities),
      ],
    ),
  );
}
