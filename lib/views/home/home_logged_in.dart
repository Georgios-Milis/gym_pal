import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';

class HomeLoggedIn extends StatefulWidget {
  const HomeLoggedIn({Key? key}) : super(key: key);
  @override
  _HomeLoggedInState createState() => _HomeLoggedInState();
}

class _HomeLoggedInState extends State<HomeLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context,
          isAppTitle: false,
          titleText: 'You are logged in',
          removeBackButton: true),
      body: const Center(
        child: Text('This is the home page text!'),
      ),
    );
  }
}
