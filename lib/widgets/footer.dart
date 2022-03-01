import 'package:flutter/material.dart';

BottomAppBar footer() {
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
