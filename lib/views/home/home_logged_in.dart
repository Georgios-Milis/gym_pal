import 'package:flutter/material.dart';

class HomeLoggedIn extends StatefulWidget {
  const HomeLoggedIn({Key? key}) : super(key: key);
  @override
  _HomeLoggedInState createState() => _HomeLoggedInState();
}

// ignore: use_key_in_widget_constructors
class SideNav extends StatelessWidget {
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
        //leading: IconButton(
        //  icon: const Icon(Icons.menu),
        //  onPressed: () {},
      ),
      drawer: Drawer(
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
                      color: Colors.blue,
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
                onPressed: () {},
                child: const Text("START NOW!"),
              ),
            ),
            const Divider(
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/cardio-purple.png'),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset('../../../assets/test-results-grey.png'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: const <Widget>[],
        ),
        color: Colors.blue,
      ),
    );
  }
}
