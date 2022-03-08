import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class CounterWidget extends StatefulWidget {
  final String title;
  int count;

  CounterWidget({Key? key, this.title = "Count", this.count = 0})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditCounterWidgetState();
}

class _EditCounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
      widget.count = _count;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
        widget.count = _count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(widget.title),
                  const SizedBox(width: 30),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text("${widget.count}"),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: IconButton(
                      onPressed: _incrementCount,
                      icon: const Icon(Icons.arrow_drop_up),
                      tooltip: "More",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: IconButton(
                      onPressed: _decrementCount,
                      icon: const Icon(Icons.arrow_drop_down),
                      tooltip: "Less",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Entry {
  final bool timed;
  final String title;
  final int? sets;
  final int? reps;
  final int? mins;
  final bool coach;

  Entry(
      {required this.timed,
      required this.title,
      this.sets,
      this.reps,
      this.mins,
      required this.coach});
}

class ViewEditWorkoutWidget extends StatefulWidget {
  const ViewEditWorkoutWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditWorkoutWidgetState();
}

class _ViewEditWorkoutWidgetState extends State<ViewEditWorkoutWidget> {
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _scrollController = ScrollController();

  bool _audio = true;

  final CounterWidget _setsCounter = CounterWidget(title: "Sets: ");
  final CounterWidget _repsCounter = CounterWidget(title: "Reps: ");

  final CounterWidget _timeCounter = CounterWidget(title: "Minutes: ");

  @override
  void dispose() {
    _titleController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Add Workout'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      //bottomNavigationBar: bottom(),
      body: DefaultTabController(
        length: 2,
        child: Builder(
          builder: (BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent[700],
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                  color: Colors.white,
                ),
                actions: <Widget>[
                  // Save
                  IconButton(
                    onPressed: () {
                      var k1 = _formKey1.currentState;
                      var k2 = _formKey2.currentState;
                      int? index = DefaultTabController.of(context)!.index;
                      if (index == 0) {
                        if (k1 != null) {
                          if (k1.validate()) {
                            final workout = Entry(
                              timed: false,
                              title: _titleController.text,
                              sets: _setsCounter.count,
                              reps: _repsCounter.count,
                              coach: _audio,
                            );
                            Navigator.pop(context, workout);
                          }
                        }
                      }
                      if (index == 1) {
                        if (k2 != null) {
                          if (k2.validate()) {
                            final workout = Entry(
                              timed: true,
                              title: _titleController.text,
                              mins: _timeCounter.count,
                              coach: _audio,
                            );
                            Navigator.pop(context, workout);
                          }
                        }
                      }
                    },
                    icon: const Icon(Icons.check),
                    color: Colors.white,
                  ),
                ],
                bottom: const TabBar(
                  tabs: [
                    Tab(text: "REPETITIVE"),
                    Tab(text: "TIMED"),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  /*
              * TAB 1
              *
              */
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Form(
                      key: _formKey1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Title",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                controller: _titleController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Title cannot be empty!";
                                  }
                                  return null;
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Customize your workout! Is it repetitive?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: <Widget>[
                                _setsCounter,
                                _repsCounter,
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Hey pal! Want audio feedback while training?",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  //width: 600,
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                          'assets/images/panda-victorious.png'),
                                      const Text("No, thanks"),
                                      Switch(
                                        value: _audio,
                                        onChanged: (value) {
                                          setState(() {
                                            _audio = value;
                                          });
                                        },
                                      ),
                                      const Text("Yes!"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  /*
              * TAB 2
              *
              */
                  SingleChildScrollView(
                    controller: _scrollController,
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: "Title",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                  ),
                                ),
                                controller: _titleController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Title cannot be empty!";
                                  }
                                  return null;
                                }),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Customize your workout! How much time will you exercise?",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Center(
                            child: Column(
                              children: <Widget>[
                                _timeCounter,
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Hey pal! Want audio feedback while training?",
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  //width: 600,
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.asset(
                                          'assets/images/panda-victorious.png'),
                                      const Text("No, thanks"),
                                      Switch(
                                        value: _audio,
                                        onChanged: (value) {
                                          setState(() {
                                            _audio = value;
                                          });
                                        },
                                      ),
                                      const Text("Yes!"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
