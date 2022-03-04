import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gym_pal/views/workouts/addWorkout.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Credits'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: bottom(),
    );
  }
}
