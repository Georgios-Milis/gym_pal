import 'package:flutter/material.dart';

import 'package:gym_pal/views/home/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gym Pal',
    theme: ThemeData(
      primarySwatch: Colors.purple,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
    ),
    home: const Home(),
  ));
}
