import 'package:flutter/material.dart';

<<<<<<< HEAD
import 'package:gym_pal/views/workouts/timed_session.dart';
=======
import 'package:gym_pal/views/chart/weight_chart.dart';
import 'package:gym_pal/views/workouts/workouts.dart';
>>>>>>> b87f8b0e281e538c6da7adf5e2510ecd96eae44d
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
<<<<<<< HEAD
    home: WorkoutsPage(),
=======
    home: WorkoutsPage(), //WorkoutsPage(), //WeightChart(),
>>>>>>> b87f8b0e281e538c6da7adf5e2510ecd96eae44d
  ));
}