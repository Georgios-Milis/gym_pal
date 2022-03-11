import 'package:flutter/material.dart';
//import 'package:duration_picker/duration_picker.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:gym_pal/views/workouts/add_workout.dart';
import 'package:gym_pal/views/workouts/rep_session.dart';
import 'package:gym_pal/views/workouts/timed_session.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutsPageState();
}

class Workout {
  final bool timed;
  final String title;
  final int? sets;
  final int? reps;
  final Duration? duration;
  final bool coach;

  Workout(
      {required this.timed,
      required this.title,
      this.sets,
      this.reps,
      this.duration,
      required this.coach});
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  final _workouts = <Workout>[];

  void _addEntry(Workout? w, int i, {bool edit = false}) async {
    Entry toEdit = Entry(
      coach: true,
      timed: false,
      title: "",
      sets: 0,
      reps: 0,
      duration: const Duration(),
    );
    if (w != null) {
      toEdit = Entry(
        title: w.title,
        coach: w.coach,
        timed: w.timed,
        sets: (w.sets == null) ? 0 : w.sets!,
        reps: (w.reps == null) ? 0 : w.reps!,
        duration: (w.duration == null) ? const Duration() : w.duration!,
      );
    }
    final Entry? _newEntry = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ViewEditWorkoutWidget(toEdit),
      ),
    );

    if (_newEntry != null) {
      Workout newWorkout = Workout(
        timed: _newEntry.timed,
        title: _newEntry.title,
        sets: _newEntry.sets,
        reps: _newEntry.reps,
        duration: _newEntry.duration,
        coach: _newEntry.coach,
      );
      if (edit == false) {
        _workouts.add(newWorkout);
      } else {
        _workouts[i] = newWorkout;
      }
      setState(() {});
    }
  }

  String formatDuration(Duration? d) {
    String res = "";
    if (d != null) {
      int hrs = d.inHours;
      int mins = d.inMinutes - d.inHours * 60;
      int sec = d.inSeconds - d.inMinutes * 60;

      res = res + (d.inHours == 0 ? "" : hrs.toString() + " hrs ");
      res = res + (d.inMinutes == 0 ? "" : " " + mins.toString() + " mins ");
      res = res + (d.inSeconds == 0 ? "" : " " + sec.toString()) + " sec ";
    }
    return res;
  }

  Widget _buildWorkoutList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: _workouts.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return Slidable(
          key: ValueKey(index),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const ScrollMotion(),
            children: [
<<<<<<< HEAD
              IconButton(
                tooltip: "Edit",
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => _addEntry(_workouts[index], index, edit: true),
              ),
              IconButton(
                tooltip: "Delete",
                icon: const Icon(Icons.delete_outlined),
                onPressed: () {
                  setState(() {
                    _workouts.removeAt(index);
                  });
                },
              ),
=======
              Expanded(
                  flex: 5,
                  child: IconButton(
                    tooltip: "Edit",
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _addEntry(_workouts[index]),
                  )),
              Expanded(
                  flex: 5,
                  child: IconButton(
                    tooltip: "Delete",
                    icon: const Icon(Icons.delete_outlined),
                    onPressed: () {
                      setState(() {
                        _workouts.removeAt(index);
                      });
                    },
                  )),
>>>>>>> 5aba63dec9928ca3581031bb1289f25d17c1e867
            ],
          ),
          child: ListTile(
            title: Text(_workouts[index].title),
            subtitle: Text(_workouts[index].timed
                ? formatDuration(_workouts[index].duration)
                : "${_workouts[index].sets.toString()} sets, ${_workouts[index].reps.toString()} reps"),
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
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  onPressed: () {
                    if (_workouts[index].timed) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TimedSession(_workouts[index]),
                        ),
                      );
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RepSession(_workouts[index]),
                        ),
                      );
                    }
                  },
                  tooltip: "Start Workout",
                  backgroundColor: Colors.tealAccent[200],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Workout start = Workout(coach: true, title: "", timed: false);
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
        onPressed: () => _addEntry(start, 0),
        tooltip: "Add new workout",
        backgroundColor: Colors.tealAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
