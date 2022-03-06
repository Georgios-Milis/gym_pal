import 'package:flutter/material.dart';

import 'package:gym_pal/views/workouts/add_workout.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutsPageState();
}

class Workout {
  String title;
  int? sets;
  int? reps;
  bool coach;

  Workout({required this.title, this.sets, this.reps, required this.coach});
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  final _workouts = <Workout>[];

  void _addEntry() async {
    final Entry? _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ViewEditWorkoutWidget(),
      ),
    );

    if (_newEntry != null) {
      _workouts.add(Workout(
        title: _newEntry.title,
        sets: _newEntry.sets,
        reps: _newEntry.reps,
        coach: _newEntry.coach,
      ));
      setState(() {});
    }
  }

  Widget _buildWorkoutList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _workouts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_workouts[index].title),
          subtitle: Text(
              "${_workouts[index].sets.toString()} sets, ${_workouts[index].reps.toString()} reps"),
          tileColor: Colors.tealAccent[400],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          trailing: Wrap(
            spacing: 10,
            children: <Widget>[
              Visibility(
                visible: _workouts[index].coach,
                child: IconButton(
                  icon: Image.asset('assets/images/Panda.png'),
                  onPressed: () {},
                  tooltip: "Audio Feedback",
                ),
              ),
              FloatingActionButton(
                heroTag: index.toString(),
                child: const Text(
                  "GO!",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                tooltip: "Start Workout",
                backgroundColor: Colors.tealAccent[200],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'My Workouts'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body: _buildWorkoutList(),
      bottomNavigationBar: bottom(context),
      floatingActionButton: FloatingActionButton(
        heroTag: "Add",
        child: const Icon(Icons.add),
        onPressed: _addEntry,
        tooltip: "Add new workout",
        backgroundColor: Colors.tealAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
