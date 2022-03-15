import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_tts/flutter_tts.dart';

import 'package:gym_pal/views/workouts/timed_session.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

late Duration du = Duration();
bool isRunning = false;
bool r = false;

class CountdownPage extends StatefulWidget {
  CountdownPage(Duration d, {Key? key}) : super(key: key) {
    du = d;
  }
  _CountdownPageState a = _CountdownPageState();
  @override
  _CountdownPageState createState() => a;
}

class _CountdownPageState extends State<CountdownPage> {
  final FlutterTts tts = FlutterTts();
  Duration duration = Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    reset();

    tts.setLanguage('en');
    tts.setSpeechRate(0.4);
    startTimer();
  }

  void reset() {
    setState(() => duration = du);
  }

  void stopTimer() {
    setState(() => timer?.cancel());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void addTime() {
    const addSeconds = -1;
    if (duration == du && isRunning == true && !volumeClick) {
      tts.speak("Get ready for your workout!");
      sleep(Duration(seconds: 3));
      tts.speak("Go!");
      sleep(Duration(seconds: 1));
      // @todo: fix! we are losing a second here because the next addTime
      // has already been called and is updating the duration at the same
      // time with the tts addTime.
    }
    if (isRunning == true) {
      setState(() {
        var seconds = duration.inSeconds + addSeconds;
        if (seconds <= 0 && !volumeClick) {
          tts.speak('Time is up. Well done pal!');
        }
        if (seconds <= 0) {
          timer?.cancel();
          isRunning = false;
          reset();
        }
        var durPerc = seconds % 20;
        if (durPerc == 0 && seconds != 0 && seconds < 61 && !volumeClick) {
          tts.speak('$seconds seconds left');
        }

        duration = Duration(seconds: seconds);
      });
    }
    if (r == true) {
      r = false;
      setState(() {
        final seconds = duration.inSeconds + addSeconds;
        if (seconds <= 0) {
          timer?.cancel();
        }

        duration = du;
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: buildTime()),
      );
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
