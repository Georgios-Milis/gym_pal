import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/widgets/timer.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

//import 'package:vibration/vibration.dart';

bool volumeClick = true;
bool isRunning = false;
int counter_sets = 1;
int counter_reps = 0;
int pace = 3;

class RepSession extends StatefulWidget {
  late Workout wk;
  RepSession(Workout w, {Key? key}) : super(key: key) {
    wk = w;
  }
  @override
  _RepSession createState() => _RepSession();
}

class _RepSession extends State<RepSession> {
  final FlutterTts tts = FlutterTts();
  late String? title;
  late int? sets;
  late int? reps;
  late Duration duration = Duration(seconds: 0);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);

    reset();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  // @todo: reset does not work properly.
  // @todo: add delay between reps and some tts messages. E.g:
  // tts.speak("Set $counter_sets is done!");
  // tts.speak("Let's take a break!");
  // sleep(Duration(seconds: 10));
  // tts.speak("Ready for the next set?");
  // sleep(Duration(seconds: 3));
  // tts.speak("Let's go!");
  // sleep(Duration(seconds: 1));
  void reset() {
    counter_reps = 0;
    counter_sets = 1;
    setState(() => {duration = du});
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  void addTime() {
    final addSeconds = 1;
    if (isRunning == true) {
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds < 0) {
          timer?.cancel();
        }
        duration = Duration(seconds: seconds);
        if (duration.inSeconds % pace == 0) addcnt();
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addcnt() {
    if (counter_reps != reps) {
      counter_reps += 1;
      if (!volumeClick) {
        tts.speak('$counter_reps');
      }
    }
    if (counter_reps == reps && counter_sets != sets) {
      counter_reps = 0;
      counter_sets += 1;
      if (!volumeClick) {
        tts.speak('Set $counter_sets');
      }
    }
  }

  void finish() {
    setState(() async {
      if (counter_reps == reps && counter_sets == sets) {
        //if (await Vibration.hasVibrator()) {
        //  Vibration.vibrate();
        //}
        await congrats();
      }
    });
  }

  Future<void> congrats() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You did this!'),
          content: Image.asset('assets/images/panda-victorious.png'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Thanks!'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    inspect(widget.wk);
    title = widget.wk.title;
    sets = widget.wk.sets;
    reps = widget.wk.reps;
    return Scaffold(
        appBar: header(context, isAppTitle: false, titleText: '$title session'),
        drawer: Drawer(
          child: sidenav(context),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Set:  ", style: TextStyle(fontSize: 20)),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("${counter_sets}",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Text("Of:", style: TextStyle(fontSize: 20)),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child:
                              Text("${sets}", style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Reps:", style: TextStyle(fontSize: 20)),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text("${counter_reps}",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                      Text("Of:", style: TextStyle(fontSize: 20)),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "${reps}",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ]),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: IconButton(
                    iconSize: 72,
                    icon: Icon((volumeClick == false)
                        ? (Icons.volume_up)
                        : Icons.volume_off),
                    onPressed: () {
                      setState(() {
                        volumeClick = !volumeClick;
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: SizedBox(
                          width: 200,
                          child: Image.asset('assets/images/panda1-250.png'),
                        )),
                    Expanded(
                        flex: 5,
                        child: Column(
                          children: <Widget>[
                            // Add divider
                            Expanded(flex: 2, child: Container()),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 120,
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepPurpleAccent[700]),
                                  ),
                                  onPressed: () {
                                    if (pace != 1) pace -= 1;
                                  },
                                  child: const Text('FASTER'),
                                ),
                              ),
                            ),
                            Expanded(flex: 2, child: Container()),
                            Expanded(
                              flex: 2,
                              child: SizedBox(
                                width: 120,
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.deepPurpleAccent[700]),
                                  ),
                                  onPressed: () {
                                    if (pace != 5) pace += 1;
                                  },
                                  child: Text('SLOWER'),
                                ),
                              ),
                            ),
                            Expanded(flex: 2, child: Container()),
                          ],
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: 120,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent[700]),
                        ),
                        onPressed: () {
                          counter_sets = 0;
                          counter_reps = 0;
                        },
                        child: const Text('RESET'),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent[700]),
                        ),
                        onPressed: () {
                          setState(() {
                            isRunning = !isRunning;
                          });
                        },
                        child: Text(isRunning == true ? 'PAUSE' : 'PLAY'),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all(
                              Colors.deepPurpleAccent[700]),
                        ),
                        onPressed: () {
                          setState(() {
                            isRunning = !isRunning;
                          });
                          Navigator.pop(context);
                        },
                        child: Text('STOP'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottom(context));
  }
}
