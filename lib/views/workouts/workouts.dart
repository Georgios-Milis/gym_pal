import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Workouts extends StatefulWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My workouts"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(null),
            ),
          ],
        ),
        color: Colors.deepPurpleAccent[700],
      ),
      // Remove BottomAppBar and add OurBottomBar()
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
        backgroundColor: Colors.tealAccent[200],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
