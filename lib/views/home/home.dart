import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:gym_pal/views/home/home_gym_pal.dart';
import 'package:gym_pal/views/home/home_health_pal.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  late PageController pageController;
  int pageIndex = 0;
  String username = "";

  @override
  void initState() {
    super.initState();
    pageController = PageController();

    // Detects when user signed in
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Silently reauthenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
      handleSignIn(account);
    }).catchError((err) {
      print('Error signing in: $err');
    });
  }

  handleSignIn(GoogleSignInAccount? account) {
    if (account != null) {
      print('User signed in: $account');
      setState(() {
        username = (account.displayName ?? '');
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }

  logout() {
    googleSignIn.signOut();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  login() {
    print('clicked');
    googleSignIn.signIn();
  }

  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Scaffold buildAuthScreen() {
    // return ElevatedButton(
    //   onPressed: logout,
    //   child: const Text('Logout'),
    // );
    return Scaffold(
      appBar:
          header(context, isAppTitle: false, titleText: 'Welcome, $username!'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body: PageView(
        children: const <Widget>[
          HomeGymPal(),
          HomeHealthPal(),
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: const AlwaysScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        backgroundColor: Colors.deepPurpleAccent[700],
        activeColor: Colors.white,
        inactiveColor: Colors.white.withAlpha(75),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone_outlined),
          ),
        ],
      ),
    );
  }

  Scaffold buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.teal,
              Colors.purple,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Gym Pal',
              style: TextStyle(
                fontFamily: "Signatra",
                fontSize: 90.0,
                color: Colors.white,
              ),
            ),
            const Image(
                image: AssetImage('assets/images/welcome_to_gym_buddy3.png')),
            GestureDetector(
              onTap: () => login(),
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
