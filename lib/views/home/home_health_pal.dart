import 'package:flutter/material.dart';

import 'package:speech_balloon/speech_balloon.dart';

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
            Expanded(
              flex: 5,
              child: Row(
                children: [
                  Expanded(child: Container(), flex: 1),
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SpeechBalloon(
                        nipHeight: 24,
                        borderRadius: 20,
                        width: 600,
                        height: 300,
                        color: Colors.deepPurpleAccent,
                        child: Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            children: const [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Hi!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Signatra",
                                    color: Color.fromARGB(255, 0, 255, 229),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "I'm Dr.Tiger, your Health Pal!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 36,
                                    fontFamily: "Signatra",
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  "I will help you monitor your health and achieve your goals with your workouts!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontFamily: "Signatra",
                                    color: Color.fromARGB(255, 0, 255, 229),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container(), flex: 1),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                child: Image.asset('assets/images/tiger2.png'),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(flex: 4, child: Container()),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        child: const Text("START NOW!"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.deepPurpleAccent,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
                  ),
                  Expanded(flex: 2, child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
      // body: Center(
      //   child: Column(
      //     children: <Widget>[
      //       RichText(
      //         text: const TextSpan(
      //           text: "Hi! I'm ",
      //           //style: DefaultTextStyle(),
      //           children: <TextSpan>[
      //             TextSpan(
      //               text: "Dr. Tiger ",
      //               style: TextStyle(
      //                 color: Colors.deepPurpleAccent,
      //               ),
      //             ),
      //             TextSpan(text: "your Health Pal!"),
      //           ],
      //         ),
      //       ),
      //       const Text(
      //           "I will help you monitor your health and achieve your goals with your workouts!"),
      //       SizedBox(
      //         width: 200,
      //         child: Image.asset('assets/images/tiger.png'),
      //       ),
      //       SizedBox(
      //         width: 200,
      //         child: ElevatedButton(
      //           child: const Text("START NOW!"),
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStateProperty.all<Color>(
      //               Colors.deepPurpleAccent,
      //             ),
      //             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //               RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(18.0),
      //               ),
      //             ),
      //           ),
      //           onPressed: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => const WeightChart(),
      //             ));
      //           },
      //         ),
      //       ),
      //       // const Divider(
      //       //   color: Colors.deepPurpleAccent,
      //       // ),
      //       // Row(
      //       //   mainAxisAlignment: MainAxisAlignment.center,
      //       //   children: <Widget>[
      //       //     IconButton(
      //       //       onPressed: () {
      //       //         Navigator.pop(context);
      //       //       },
      //       //       icon: Image.asset('assets/images/cardio-grey.png'),
      //       //     ),
      //       //     IconButton(
      //       //       onPressed: () {},
      //       //       icon: Image.asset('assets/images/test-results-purple.png'),
      //       //     ),
      //       //   ],
      //       // ),
      //     ],
      //   ),
      // ),
      // bottomNavigationBar: bottom(context),
    );
  }
}
