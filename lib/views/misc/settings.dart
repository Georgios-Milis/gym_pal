import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _passwordController = TextEditingController();
  bool _dark = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Settings'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      bottomNavigationBar: bottom(context),
      body: Column(
        children: [
          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("Change password"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: "New password",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password cannot be empty!";
                }
                return null;
              },
            ),
          ),
          const Divider(),
          Flexible(
            flex: 50,
            fit: FlexFit.loose,
            child: Row(
              children: [
                const Text("Dark mode"),
                Switch(
                  value: _dark,
                  onChanged: (value) {
                    setState(() {
                      _dark = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          const Text("Logout"),
          SizedBox(
            width: 200,
            height: 30,
            child: TextButton(
              onPressed: () {},
              child: const Text("LOGOUT"),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.deepPurple[100]),
                foregroundColor:
                    MaterialStateProperty.all(Colors.deepPurpleAccent[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
