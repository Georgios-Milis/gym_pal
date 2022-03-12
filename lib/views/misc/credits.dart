import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class Credits extends StatelessWidget {
  const Credits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Credits'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: bottom(context),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/robot2.png'),
                  width: 200,
                  height: 200,
                ),
                const Text(
                  "George \n Team Leader \n & \n General Overlord",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/robot1.png'),
                  width: 200,
                  height: 200,
                ),
                const Text(
                  "Apostolos \n Design \n Specialist",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              children: [
                SizedBox(
                  child: Image.asset('assets/images/robot3.png'),
                  width: 200,
                  height: 200,
                ),
                const Text(
                  "Thomas \n Creative Genius",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
