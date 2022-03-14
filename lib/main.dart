import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:hive/hive.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gym_pal/views/home/home.dart';

late List<CameraDescription> cameras;

String username = "";
bool isAuth = false;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> main() async {
  // Key-Value Store
  // var workoutBox = await Hive.openBox('workouts');
  // var settingsBox = await Hive.openBox('settings');
  // var weightBox = await Hive.openBox('weights');

  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(HCIApp());
}

class HCIApp extends StatefulWidget {
  const HCIApp({Key? key}) : super(key: key);

  @override
  _HCIAppState createState() => _HCIAppState();

  static _HCIAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HCIAppState>();
}

class _HCIAppState extends State<HCIApp> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gym Pal',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: Home(),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}
