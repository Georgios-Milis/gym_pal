import 'package:flutter/material.dart';

import 'package:speech_balloon/speech_balloon.dart';

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
                                  "I'm Pandy, your Gym Pal!",
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
                                  "Let's create some custom sessions so that we can work out together!",
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
                child: Image.asset('assets/images/Panda.png'),
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
                            builder: (context) => const WorkoutsPage(),
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
    );
  }
}
