import 'package:flutter/material.dart';
import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/widgets/chart.dart';
import 'package:camera/camera.dart';
import 'package:gym_pal/main.dart';

Future<void> cam() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
}

class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);
  @override
  _WeightChartInState createState() => _WeightChartInState();
}

class _WeightChartInState extends State<WeightChart> {
  late CameraController controller;
  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Weight Chart'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text("Last 8 months"),
              SizedBox(
                width: 400,
                height: 200,
                child: SimpleBarChart.withoutData(false),
              ),
              const Text("Log your weight now!"),
              SizedBox(
                width: 200,
                child: Image.asset('assets/images/tiger.png'),
              ),
              const Divider(
                color: Colors.deepPurpleAccent,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CameraPreview(controller)));
                      },
                      icon: const Icon(Icons.camera_alt)),
                  IconButton(
                      icon: const Icon(Icons.create_rounded),
                      onPressed: () {
                        openDialog();
                      } // (){openDialog}
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottom(context),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Your Weight'),
          content: const TextField(
              autofocus: true,
              decoration: InputDecoration(hintText: 'Enter your weight')),
          actions: [
            TextButton(
              child: const Text('Cancel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 37, 34, 34),
                  )),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: const Text('Log',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                  )),
              onPressed: Navigator.of(context).pop,
            ),
          ],
        ),
      );
}
