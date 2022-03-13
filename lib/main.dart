import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:hive/hive.dart';

import 'package:gym_pal/views/workouts/timed_session.dart';
import 'package:gym_pal/views/workouts/rep_session.dart';
import 'package:gym_pal/views/workouts/workouts.dart';
import 'package:gym_pal/views/home/home.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  // Key-Value Store
  // var workoutBox = await Hive.openBox('workouts');
  // var settingsBox = await Hive.openBox('settings');
  // var weightBox = await Hive.openBox('weights');

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MaterialApp(
    title: 'Gym Pal',
    theme: ThemeData(
      primarySwatch: Colors.purple,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
    ),
    home: Home(),
  ));
}
