import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class CounterWidget extends StatefulWidget {
  final String title;

  const CounterWidget({Key? key, this.title = "Count"}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _EditCounterWidgetState();
}

class _EditCounterWidgetState extends State<CounterWidget> {
  int _count = 0;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _decrementCount() {
    setState(() {
      if (_count > 0) {
        _count--;
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
                      child: Text("$_count"),
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
  String title;
  int? sets;
  int? reps;
  bool coach;

  Entry({required this.title, this.sets, this.reps, required this.coach});
}

class ViewEditWorkoutWidget extends StatefulWidget {
  const ViewEditWorkoutWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditWorkoutWidgetState();
}

class _ViewEditWorkoutWidgetState extends State<ViewEditWorkoutWidget> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();

  bool _audio = true;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Add Workout'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: bottom(),
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
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
                  if (_formKey.currentState!.validate()) {
                    final workout = Entry(
                      title: _titleController.text,
                      sets: 0,
                      reps: 0,
                      coach: _audio,
                    );
                    Navigator.pop(context, workout);
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
          body: Form(
            key: _formKey,
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
                  child: Text("Customize your workout! Is it repetitive?"),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      const CounterWidget(title: "Sets: "),
                      const CounterWidget(title: "Reps: "),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                          "Hey pal! Want audio feedback while training?"),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child:
                            Image.asset('assets/images/panda-victorious.png'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
