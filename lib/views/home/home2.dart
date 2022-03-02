import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym_pal/views/home/home_logged_in.dart';
import 'package:gym_pal/views/chart/weight_chart.dart';

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);
  @override
  _Home2 createState() => _Home2();
}

class _Home2 extends State<Home2> {
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
            RichText(
              text: const TextSpan(
                text: "Hi! I'm ",
                //style: DefaultTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: "Dr. Tiger ",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                  TextSpan(text: "your Health Pal!"),
                ],
              ),
            ),
            const Text(
                "I will help you monitor your health and achieve your goals with your workouts!"),
            SizedBox(
              width: 200,
              child: Image.asset('/assets/images/tiger.png'),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WeightChart()),
                  );
                },
                child: const Text("SHOW NOW!"),
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/images/cardio-grey.png'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/images/test-results-purple.png'),
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
