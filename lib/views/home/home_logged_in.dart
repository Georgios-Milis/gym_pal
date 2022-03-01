import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym_pal/views/home/home2.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/footer.dart';

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
      appBar:
          header(context, isAppTitle: false, titleText: 'Welcome, $username!'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RichText(
              text: const TextSpan(
                text: "Hi! I'm ",
                //style: DefaultTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: "Pandy ",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  TextSpan(text: "your Gym Pal!"),
                ],
              ),
            ),
            const Text(
                "Let's create some custom sessions so that we can work out together!"),
            SizedBox(
              width: 200,
              child: Image.asset('../../../assets/Panda.png'),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text("START NOW!"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent[700],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Workouts(),
                  ));
                },
              ),
            ),
            const Divider(
              color: Colors.deepPurpleAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/cardio-purple.png'),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home2()),
                    );
                  },
                  icon: Image.asset('../../../assets/test-results-grey.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: footer(),
    );
  }
}
