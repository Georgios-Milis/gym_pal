import 'package:flutter/material.dart';
import 'package:gym_pal/views/workouts/timed_session.dart';
import 'package:gym_pal/views/workouts/rep_session.dart';
import 'package:camera/camera.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MaterialApp(
    title: 'Gym Pal',
    theme: ThemeData(
      primarySwatch: Colors.purple,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
    ),
    home: WorkoutsPage(),

  ));
}