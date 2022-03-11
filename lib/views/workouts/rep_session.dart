import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
//import 'package:gym_pal/widgets/timer.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

bool volumeClick = true;
bool isRunning = false;
int counter = 0;

class RepSession extends StatefulWidget {
  late Workout wk;
  RepSession(Workout w, {Key? key}) : super(key: key) {
    this.wk = w;
  }
  @override
  _RepSession createState() => _RepSession();
}

class _RepSession extends State<RepSession> {
  late String? title;
  late int? sets;
  late int? reps;
  @override
  Widget build(BuildContext context) {
    title = widget.wk.title;
    sets = widget.wk.sets;
    reps = widget.wk.reps;
    return Scaffold(
        appBar:
            header(context, isAppTitle: false, titleText: '${title} Session'),
        drawer: Drawer(
          child: sidenav(context),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Set:  ", style: TextStyle(fontSize: 20)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("3", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Text("Of:", style: TextStyle(fontSize: 20)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("${sets}", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ]),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Reps:", style: TextStyle(fontSize: 20)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text("3", style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    Text("Of:", style: TextStyle(fontSize: 20)),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          "${reps}",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ]),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      flex: 5,
                      child: SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/panda1-250.png'),
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            child: IconButton(
                              icon: Icon((volumeClick == false)
                                  ? (Icons.volume_up)
                                  : Icons.volume_off),
                              onPressed: () {
                                setState(() {
                                  volumeClick = !volumeClick;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurpleAccent[700]),
                              ),
                              onPressed: () {},
                              child: Text('FASTER'),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 120,
                            child: TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurpleAccent[700]),
                              ),
                              onPressed: () {},
                              child: Text('SLOWER'),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurpleAccent[700]),
                      ),
                      onPressed: () {},
                      child: Text('RESET'),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurpleAccent[700]),
                      ),
                      onPressed: () {
                        setState(() {
                          isRunning = !isRunning;
                        });
                      },
                      child: Text(isRunning == true ? 'PAUSE' : 'PLAY'),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Colors.deepPurpleAccent[700]),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop;
                      },
                      child: Text('STOP'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: bottom(context));
  }
}
