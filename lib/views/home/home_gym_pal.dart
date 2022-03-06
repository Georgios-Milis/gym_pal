import 'package:flutter/material.dart';

import 'package:gym_pal/views/workouts/workouts.dart';

class HomeGymPal extends StatefulWidget {
  const HomeGymPal({Key? key}) : super(key: key);

  @override
  _HomeGymPalState createState() => _HomeGymPalState();
}

class _HomeGymPalState extends State<HomeGymPal> {
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
              child: Image.asset('assets/images/Panda.png'),
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
                    builder: (context) => const WorkoutsPage(),
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
            //       onPressed: () {},
            //       icon: Image.asset('assets/images/cardio-purple.png'),
            //     ),
            //     IconButton(
            //       onPressed: () {
            //         Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const HomeHealthPal()),
            //         );
            //       },
            //       icon: Image.asset('assets/images/test-results-grey.png'),
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
