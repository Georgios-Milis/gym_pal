import 'package:flutter/material.dart';

BottomAppBar bottom(context) {
  return BottomAppBar(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        IconButton(
          onPressed: null,
          icon: Icon(null),
        ),
      ],
    ),
    color: Colors.deepPurpleAccent[700],
  );
}
