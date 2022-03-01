import 'package:flutter/material.dart';

class HomeLoggedIn extends StatefulWidget {
  const HomeLoggedIn({Key? key}) : super(key: key);
  @override
  _HomeLoggedInState createState() => _HomeLoggedInState();
}

class _HomeLoggedInState extends State<HomeLoggedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        body: Center(
          child: <Widget>[
            Text("Hi! I'm Pandy your Gym Pal!"),
            Image.asset('assets/Panda.png'),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/cardio-purple.png'),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset('assets/test-results-grey.png'),
              ),
            ],
          ),
          color: Colors.blue,
        ));
  }
}
