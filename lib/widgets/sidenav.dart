import 'package:flutter/material.dart';

import 'package:gym_pal/views/home/home_logged_in.dart';
import 'package:gym_pal/views/home/home2.dart';

ListView sidenav(context) {
  return ListView(
    padding: EdgeInsets.zero,
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
            builder: (context) => const HomeLoggedIn(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_phone_outlined),
        title: const Text('Meet your Health Pal!'),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Home2(),
          ));
        },
      ),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text('Settings'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.info_outline),
        title: const Text('Credits'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
    ],
  );
}
