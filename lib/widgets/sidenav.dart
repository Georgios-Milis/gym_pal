import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'package:gym_pal/views/home/home.dart';

import 'package:gym_pal/views/misc/settings.dart';
import 'package:gym_pal/views/misc/credits.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

ListView sidenav(context) {
  return ListView(
    padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
    children: [
      ListTile(
        leading: const Icon(Icons.close),
        title: const Text(
          'Menu',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      const Divider(
        color: Colors.grey,
      ),
      ListTile(
        leading: const Icon(Icons.favorite),
        title: const Text('Meet your Gym Pal!'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_phone_outlined),
        title: const Text('Meet your Health Pal!'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Settings(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text('Credits'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Credits(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text('Logout'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home(),
          ));
        },
      ),
    ],
  );
}
