import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.title),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Text("$_count"),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: IconButton(
              onPressed: _incrementCount,
              icon: const Icon(Icons.arrow_drop_up),
              tooltip: "More",
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: IconButton(
              onPressed: _decrementCount,
              icon: const Icon(Icons.arrow_drop_down),
              tooltip: "Less",
            ),
          ),
        ],
      ),
    );
  }
}

class ViewEditWorkoutWidget extends StatefulWidget {
  const ViewEditWorkoutWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ViewEditWorkoutWidgetState();
}

class _ViewEditWorkoutWidgetState extends State<ViewEditWorkoutWidget> {
  final _formKey = GlobalKey<FormState>();
  bool _audio = true;

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
              IconButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context);
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
                      const Text(
                          "Hey pal! Want audio feedback while training?"),
                      SizedBox(
                        width: 200,
                        child: Image.asset('assets/panda-victorious.png'),
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
