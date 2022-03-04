import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym_pal/views/home/home_logged_in.dart';

void main() {
  runApp(MaterialApp(
    title: 'Gym Pal',
    theme: ThemeData(
      primarySwatch: Colors.purple,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.tealAccent),
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeLoggedIn(),
    );
  }
}
