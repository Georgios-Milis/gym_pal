import 'package:flutter/material.dart';

ListView settings(context) {
  return ListView(
    padding: EdgeInsets.zero,
    children: [
      ListTile(
        leading: const Icon(Icons.close),
        title: const Text('Menu'),
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
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(Icons.contact_phone_outlined),
        title: const Text('Meet your Health Pal!'),
        onTap: () {
          // Update the state of the app
          // ...
          // Then close the drawer
          Navigator.pop(context);
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
