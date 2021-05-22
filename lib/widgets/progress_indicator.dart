import 'package:flutter/material.dart';

Widget progressIndicator() {
  return Column(
    children: [
      Text("Loading"),
      CircularProgressIndicator(),
    ],
  );
}
