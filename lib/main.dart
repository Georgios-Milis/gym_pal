import 'package:flutter/material.dart';

import 'package:gym_pal/views/home/home_logged_in.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gym Pal',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeLoggedIn(),
    );
  }
}
