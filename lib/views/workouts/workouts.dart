import 'dart:html';

import 'package:flutter/material.dart';

class ViewEditWorkoutWidget extends StatefulWidget {
  const ViewEditWorkoutWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditWorkoutWidgetState();
}

class _ViewEditWorkoutWidgetState extends State<ViewEditWorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Edit workout"),
    ));
  }
}
