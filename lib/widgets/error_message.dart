import 'package:flutter/material.dart';

Widget errorMessage({
  required AsyncSnapshot snapshot,
}) {
  return Text("${snapshot.error}");
}
