import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

bool volumeClick = true;

class TimedSession extends StatefulWidget {
  late Workout wk;
  TimedSession(Workout w, {Key? key}) : super(key: key) {
    this.wk = w;
  }
  @override
  _TimedSession createState() => _TimedSession();
}

class _TimedSession extends State<TimedSession> {
  final FlutterTts tts = FlutterTts();
  late Duration duration = const Duration();
  late String? title;
  bool isRunning = false;
  Timer? timer;
  bool isTalking = true;

  @override
  void initState() {
    super.initState();
    title = widget.wk.title;
    duration = widget.wk.duration!;
    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
  }

  void resetBtn() {
    setState(() {
      timer?.cancel();
      duration = widget.wk.duration!;
      isRunning = false;
      isTalking = true;
    });
  }

  void startTimer() {
    setState(() {
      isTalking = true;
      isRunning = true;
    });
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    const addSeconds = -1;
    if (isTalking) {
      if (duration == widget.wk.duration && isRunning == true && !volumeClick) {
        tts.speak("Get ready for your workout!");
        sleep(Duration(seconds: 3));
        tts.speak("Go!");
        sleep(Duration(seconds: 1));
        setState(() {
          isTalking = false;
        });
      }
    } else {
      if (isRunning == true) {
        setState(() {
          var seconds = duration.inSeconds + addSeconds;
          if (seconds <= 0 && !volumeClick) {
            tts.speak('Time is up. Well done pal!');
          }
          if (seconds <= 0) {
            isRunning = false;
            resetBtn();
            finish();
            // reset();
          } else {
            var durPerc = seconds % 20;
            if (durPerc == 0 && seconds != 0 && seconds < 61 && !volumeClick) {
              tts.speak('$seconds seconds left');
            }

            duration = Duration(seconds: seconds);
          }
        });
      }
    }
  }

  void finish() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.vibrate();
    }
    await congrats();
  }

  Future<void> congrats() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You did this!'),
          content: Image.asset('assets/images/panda-victorious.png'),
          actions: <Widget>[
            TextButton(
              onPressed: () =>
                  Navigator.of(context, rootNavigator: true).pop('dialog'),
              child: const Text('Thanks!'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: header(context, isAppTitle: false, titleText: '$title session'),
        drawer: Drawer(
          child: sidenav(context),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: double.infinity,
                        child: Scaffold(
                          body: Center(child: buildTime()),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/panda1-250.png'),
                      ),
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
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
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
                          resetBtn();
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
                          startTimer();
                        },
                        child: Text(isRunning ? 'PAUSE' : 'GO!'),
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
                        child: const Text('STOP'),
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

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'Hours'),
      const SizedBox(width: 4),
      buildTimeCard(time: minutes, header: 'Minutes'),
      const SizedBox(width: 4),
      buildTimeCard(time: seconds, header: 'Seconds')
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            time,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
        ),
        const SizedBox(height: 7),
        Text(header),
      ]);
}
