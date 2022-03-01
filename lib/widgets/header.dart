import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, String titleText = ""}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Gym Pal" : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle ? "Signatra" : "",
        fontSize: isAppTitle ? 50.0 : 22.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    backgroundColor: Theme.of(context).colorScheme.secondary,
  );
}
