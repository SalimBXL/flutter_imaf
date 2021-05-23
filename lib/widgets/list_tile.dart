import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/friendship.dart';
import 'package:flutter_imaf/services/consts.dart';
import 'package:flutter_imaf/widgets/activities_icons.dart';

Widget friendActivities({required Friendship friendship}) {
  return Container(
    color: GREY_ACCENT,
    child: activitiesIcons(
        activities: friendship.friend.friendActivities,
        invertColors: true,
        showOnlyActives: true),
  );
}

Widget friendName({required Friendship friendship}) {
  return Expanded(
    child: Text(
      friendship.friend.username,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
        color: GREY_ACCENT,
      ),
    ),
  );
}

Widget allowedActivitiesWithThisFriend({required Friendship friendship}) {
  return activitiesIcons(activities: friendship.activities);
}

Widget listTile({required Friendship friendship}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        friendName(friendship: friendship),
        friendActivities(friendship: friendship),
        allowedActivitiesWithThisFriend(friendship: friendship),
      ],
    ),
  );
}
