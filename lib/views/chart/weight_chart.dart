import 'package:flutter/material.dart';
import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/widgets/chart.dart';
// import 'package:camera/camera.dart';
import 'package:gym_pal/main.dart';
import 'package:gym_pal/utilities/camera.dart';

// Future<void> cam() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   cameras = await availableCameras();
// }

class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);
  @override
  _WeightChartInState createState() => _WeightChartInState();
}

class _WeightChartInState extends State<WeightChart> {
  // late CameraController controller;
  @override
  void initState() {
    super.initState();
    // controller = CameraController(cameras[0], ResolutionPreset.max);
    // controller.initialize();
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Weight Chart'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Text(
                "Last 8 months",
                style: TextStyle(
                    fontSize: 48,
                    fontFamily: "Signatra",
                    color: Color.fromARGB(255, 96, 8, 114)),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 400,
                height: 200,
                child: SimpleBarChart.withoutData(false),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Log your weight now!",
                style: TextStyle(
                    fontSize: 48,
                    fontFamily: "Signatra",
                    color: Color.fromARGB(255, 96, 8, 114)),
              ),
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 200,
                child: Image.asset('assets/images/tiger2.png'),
              ),
            ),
            const Expanded(flex: 1, child: Divider()),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                      color: const Color.fromARGB(255, 96, 8, 114),
                      iconSize: 48,
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => OCRCamera()));
                        // builder: (context) => CameraPreview(controller)));
                      },
                      icon: const Icon(Icons.camera_alt)),
                  IconButton(
                      color: const Color.fromARGB(255, 96, 8, 114),
                      iconSize: 48,
                      icon: const Icon(Icons.create_rounded),
                      onPressed: () {
                        openDialog();
                      }),
                ],
              ),
            ),
          ],
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
