import 'package:flutter/material.dart';

import 'package:gym_pal/views/workouts/add_workout.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'My Workouts'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: bottom(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ViewEditWorkoutWidget(),
            ),
          );
        },
        tooltip: "Add new workout",
        backgroundColor: Colors.tealAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
