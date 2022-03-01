import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:gym_pal/views/home/home2.dart';
import 'package:gym_pal/views/workouts/workouts.dart';

class HomeLoggedIn extends StatefulWidget {
  const HomeLoggedIn({Key? key}) : super(key: key);

  @override
  _HomeLoggedInState createState() => _HomeLoggedInState();
}

// This should be exported in a separate file
class OurBottomBar extends StatelessWidget {
  const OurBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const <Widget>[
          IconButton(
            onPressed: null,
            icon: Icon(null),
          ),
        ],
      ),
      color: Colors.deepPurpleAccent[700],
    );
  }
}

// This should be exported in a separate file
class SideNav extends StatelessWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class _HomeLoggedInState extends State<HomeLoggedIn> {
  String username = "George";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $username!'),
        backgroundColor: Colors.deepPurpleAccent[700],
      ),
      drawer: const Drawer(
        child: SideNav(),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RichText(
              text: const TextSpan(
                text: "Hi! I'm ",
                //style: DefaultTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: "Pandy ",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  TextSpan(text: "your Gym Pal!"),
                ],
              ),
            ),
            const Text(
                "Let's create some custom sessions so that we can work out together!"),
            SizedBox(
              width: 200,
              child: Image.asset('../../../assets/Panda.png'),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                child: const Text("START NOW!"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurpleAccent[700],
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const Workouts(),
                  ));
                },
              ),
            ),
            const Divider(
              color: Colors.deepPurpleAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/cardio-purple.png'),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Home2()),
                    );
                  },
                  icon: Image.asset('../../../assets/test-results-grey.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const OurBottomBar(),
    );
  }
}
