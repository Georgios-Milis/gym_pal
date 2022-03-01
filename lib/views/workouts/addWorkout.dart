import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/footer.dart';

class ViewEditWorkoutWidget extends StatefulWidget {
  const ViewEditWorkoutWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditWorkoutWidgetState();
}

class _ViewEditWorkoutWidgetState extends State<ViewEditWorkoutWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Add workout'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: footer(),
    );
  }
}
