import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:gym_pal/views/workouts/timed_session.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

class CountdownPage extends StatefulWidget {
  late Duration duration;

  CountdownPage(this.duration);
  @override
  _CountdownPageState createState() => _CountdownPageState(duration);
}

class _CountdownPageState extends State<CountdownPage> {
  Duration duration;

  _CountdownPageState(this.duration);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(child: buildTime()),
      );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(widget.duration.inHours);
    final minutes = twoDigits(widget.duration.inMinutes.remainder(60));
    final seconds = twoDigits(widget.duration.inSeconds.remainder(60));

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
