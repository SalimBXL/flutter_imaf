import 'package:flutter/material.dart';
import 'package:flutter_imaf/models/user.dart';
import 'package:flutter_imaf/services/consts.dart';
import 'package:flutter_imaf/widgets/activities_icons.dart';

Widget loggedUserPan({required User user, required List<String> activities}) {
  return Container(
    color: Colors.black54,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            user.username,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 36.0,
              color: WHITE54,
            ),
            textAlign: TextAlign.center,
          ),
          activitiesIcons(
              activities: activities, icoSize: 36, invertColors: true),
        ],
      ),
    ),
  );
}
