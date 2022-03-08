import 'package:flutter/material.dart';

import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';

bool volumeClick = true;

class TimedSession extends StatefulWidget {
  const TimedSession({Key? key}) : super(key: key);
  @override
  _TimedSession createState() => _TimedSession();
}


class _TimedSession extends State<TimedSession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Yoga Session'),
      drawer: Drawer(
      child: sidenav(context),
      ),
      body: Center(
        child: Column(
          children:<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
                SizedBox(
                  width: 200,
                  child:Image.asset('assets/images/panda1-250.png'),
                ),
                SizedBox( 
                  child: IconButton(
                    icon: Icon((volumeClick == false)?(Icons.volume_up): Icons.volume_off),

                    onPressed: (){
                      setState(() {
                        volumeClick = ! volumeClick;
                      });
                    },

                  ),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:<Widget>[
              SizedBox(
              width: 120,
               child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent[700]),
                ),
                onPressed: () { },
                child: Text('RESET'),
                ),
                ),
                SizedBox(
              width: 120,
               child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent[700]),
                ),
                onPressed: () { },
                child: Text('PAUSE'),
                ),
                ),
                SizedBox(
              width: 120,
               child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent[700]),
                ),
                onPressed: () { },
                child: Text('STOP'),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
        bottomNavigationBar: bottom(context)
      );
  }
}