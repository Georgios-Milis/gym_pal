import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/widgets/timer.dart';
import 'package:gym_pal/views/workouts/workouts.dart';
import 'dart:async';

import 'package:vibration/vibration.dart';
/* USE
if (await Vibration.hasVibrator()) {
    Vibration.vibrate();
}
*/

bool volumeClick = true;
bool isRunning = false;
int counter_sets = 0;
int counter_reps = 0;
int pace = 3;

class RepSession extends StatefulWidget {
  late Workout wk;
  RepSession(Workout w, {Key? key}) : super(key: key) {
    this.wk = w;
  }
  @override
  _RepSession createState() => _RepSession();
}

class _RepSession extends State<RepSession> {
  late String? title;
  late int? sets;
  late int? reps;
  late Duration duration = Duration(seconds: 0);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    reset();
    startTimer();
  }

  void reset() {
    setState(() => duration = du);
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
    }
    if (counter_reps == reps && counter_sets != sets) {
      counter_reps = 0;
      counter_sets += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                  Widget>[
                Text("Set:  ", style: TextStyle(fontSize: 20)),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child:
                        Text("${counter_sets}", style: TextStyle(fontSize: 20)),
                  ),
                ),
                Text("Of:", style: TextStyle(fontSize: 20)),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Text("${sets}", style: TextStyle(fontSize: 20)),
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
                  Widget>[
                Text("Reps:", style: TextStyle(fontSize: 20)),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child:
                        Text("${counter_reps}", style: TextStyle(fontSize: 20)),
                  ),
                ),
                Text("Of:", style: TextStyle(fontSize: 20)),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
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
              Row(
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
                          SizedBox(
                            child: IconButton(
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
                          SizedBox(
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
                              child: Text('FASTER'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
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
                        ],
                      )),
                ],
              ),
              Row(
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
                      child: Text('RESET'),
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
                ],
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Image.asset('assets/images/panda1-250.png'),
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
                        Navigator.of(context).pop;
                      },
                      child: Text('STOP'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottom(context));
  }
}
