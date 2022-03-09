import 'package:flutter/material.dart';

import 'package:gym_pal/views/chart/weight_chart.dart';
import 'package:gym_pal/views/workouts/workouts.dart';
import 'package:camera/camera.dart';

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
    home: WorkoutsPage(), //WorkoutsPage(), //WeightChart(),
  ));
}
