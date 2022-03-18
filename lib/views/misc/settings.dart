import 'package:flutter/material.dart';
import 'package:gym_pal/views/home/home.dart';
import 'dart:developer';
import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/main.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  void dispose() {
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Dark mode",
                        style: TextStyle(
                          fontSize: 48,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Align(
                      alignment: Alignment.center,
                      child: Switch(
                        value:
                            (Theme.of(context).brightness == Brightness.dark),
                        onChanged: (value) {
                          if (value) {
                            HCIApp.of(context)?.changeTheme(ThemeMode.dark);
                          } else {
                            HCIApp.of(context)?.changeTheme(ThemeMode.light);
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    isAuth = false;
                    googleSignIn.signOut();
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Home(),
                    ));
                  },
                  child: const Text(
                    "LOGOUT",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size.fromHeight(70)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple[100]),
                    foregroundColor:
                        MaterialStateProperty.all(Colors.deepPurpleAccent[700]),
                  ),
                ),
              ),
            ),
            Expanded(flex: 6, child: Container()),
          ],
        ),
      ),
    );
  }
}
