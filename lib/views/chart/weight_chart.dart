import 'dart:html';

import 'package:flutter/material.dart';

class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);
  @override
  _WeightChartInState createState() => _WeightChartInState();
}


class _WeightChartInState extends State<WeightChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Session'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text("Log your weight now!"),
            SizedBox(
              width: 200,
              child: Image.asset('../../../assets/tiger.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                IconButton(
                  onPressed: null,
                  icon : const Icon(Icons.camera_alt)
                ),
                IconButton(
                  onPressed: null,
                  icon : const Icon(Icons.create_rounded)
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: const <Widget>[],
        ),
        color: Colors.blue,
      ),
    );
  }
}