import 'package:flutter/material.dart';

import 'package:gym_pal/views/chart/weight_chart.dart';

class HomeHealthPal extends StatefulWidget {
  const HomeHealthPal({Key? key}) : super(key: key);
  @override
  _Home2 createState() => _Home2();
}

class _Home2 extends State<HomeHealthPal> {
  String username = "George";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      color: Colors.deepPurpleAccent,
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
              child: Image.asset('assets/images/tiger.png'),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text("START NOW!"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.deepPurpleAccent,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const WeightChart(),
                  ));
                },
              ),
            ),
            // const Divider(
            //   color: Colors.deepPurpleAccent,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     IconButton(
            //       onPressed: () {
            //         Navigator.pop(context);
            //       },
            //       icon: Image.asset('assets/images/cardio-grey.png'),
            //     ),
            //     IconButton(
            //       onPressed: () {},
            //       icon: Image.asset('assets/images/test-results-purple.png'),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: bottom(context),
    );
  }
}
