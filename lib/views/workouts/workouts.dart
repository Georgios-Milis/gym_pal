import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gym_pal/views/workouts/addWorkout.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/footer.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'My workouts'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: footer(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ViewEditWorkoutWidget(),
            ),
          );
        },
        backgroundColor: Colors.tealAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
