import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/consts.dart';

Widget friendsListTitle({required String lastRefresh}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        "Friend List",
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
          color: BLACK54,
        ),
      ),
      Text(
        "(Last refresh : $lastRefresh)",
        style: TextStyle(
          fontSize: 12.0,
          fontStyle: FontStyle.italic,
          color: BLACK54,
        ),
      ),
    ],
  );
}
