import 'dart:html';

import 'package:flutter/material.dart';

class HomeLoggedIn extends StatefulWidget {
  const HomeLoggedIn({Key? key}) : super(key: key);
  @override
  _HomeLoggedInState createState() => _HomeLoggedInState();
}

class _HomeLoggedInState extends State<HomeLoggedIn> {
  String username = "George";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Hi! I'm Pandy your Gym Pal!"),
            const Text(
                "Let's create some custom sessions so that we can work out together!"),
            SizedBox(
              width: 200,
              child: Image.asset('../../../assets/Panda.png'),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("START NOW!"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/cardio-purple.png'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/test-results-grey.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: const <Widget>[],
        ),
        color: Colors.blue,
      ),
    );
  }
}
