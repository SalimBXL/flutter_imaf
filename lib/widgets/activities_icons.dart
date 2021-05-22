import 'package:flutter/material.dart';
import 'package:flutter_imaf/services/consts.dart';

Map<Status, IconData> iconStatus = {
  Status.DRINK: Icons.emoji_food_beverage,
  Status.FOOD: Icons.restaurant,
  Status.SPORT: Icons.sports_tennis,
  Status.FUN: Icons.thermostat_rounded,
  Status.MOVIE: Icons.local_movies
};

Widget activitiesIcons({
  required List activities,
  double icoSize = 24.0,
  bool invertColors = false,
  bool showOnlyActives = false,
}) {
  activities.sort();
  List<Widget> iconList = [];
  Color color1 = invertColors ? AMBER_ACCENT : GREY_ACCENT;
  Color color2 = invertColors ? BLACK54 : FADE;

  iconStatus.forEach((key, value) {
    String keyFormatted = key.toString().split(".").last;
    Color icoColor = (activities.contains(keyFormatted)) ? color1 : color2;
    if (!showOnlyActives ||
        (showOnlyActives && activities.contains(keyFormatted))) {
      iconList.add(
        Padding(
          padding: const EdgeInsets.only(
              left: 2.0, right: 2.0, top: 0.0, bottom: 0.0),
          child: Icon(
            value,
            size: icoSize,
            color: icoColor,
          ),
        ),
      );
    }
  });

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: iconList,
  );
}
