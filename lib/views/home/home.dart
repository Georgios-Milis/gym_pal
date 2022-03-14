import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:developer';

import 'package:gym_pal/main.dart';
import 'package:gym_pal/views/home/home_gym_pal.dart';
import 'package:gym_pal/views/home/home_health_pal.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController pageController;
  int pageIndex = 0;
  final _customLoginFormKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();

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

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  customLogin() {
    setState(() {
      username = _usernameController.text;
      isAuth = true;
    });
  }

  login() {
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
        child: SingleChildScrollView(
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
              // Add form
              SingleChildScrollView(
                child: Form(
                  key: _customLoginFormKey,
                  child: Column(children: <Widget>[
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color.fromRGBO(255, 255, 255, 1),
                          hintText: "Enter your username",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username!';
                          }
                          return null;
                        },
                        controller: _usernameController,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: customLogin,
                      child: const Text('Login'),
                    ),
                  ]),
                ),
              ),
              // Add divider
              const SizedBox(height: 10.0),
              const Text(
                'or',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              // Add divider
              const SizedBox(height: 10.0),
              GestureDetector(
                onTap: () => login(),
                child: Container(
                  width: 260.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/images/google_signin_button.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Add input field
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
