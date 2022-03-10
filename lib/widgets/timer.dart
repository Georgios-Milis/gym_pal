import 'package:flutter/material.dart';
import 'dart:async';
import 'package:gym_pal/views/workouts/workouts.dart';

late Duration du;

class CountdownPage extends StatefulWidget {
  CountdownPage(Duration d,{Key? key}) : super(key: key){du = d;}
  _CountdownPageState a = _CountdownPageState();
  @override 
  _CountdownPageState createState() => a;

}

class _CountdownPageState extends State<CountdownPage>{
  Duration duration = du;
  Timer? timer;
  @override
  void initState(){
    super.initState();
    reset();
  }

  void reset(){
    setState(() => duration = du);
  }

  void stopTimer(){
    setState(() => timer?.cancel());
  }

  void addTime(){
    final addSeconds = -1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds<0){
        timer?.cancel();
      }
      duration = Duration(seconds: seconds);
    });
  }

  void startTimer(){
    timer = Timer.periodic(Duration(seconds:1),(_)=>addTime());
  }

  @override 
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: buildTime()
    ),
  );
  Widget buildTime(){
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        buildTimeCard(time: hours, header: 'Hours'),
        const SizedBox(width: 4),
        buildTimeCard(time: minutes, header: 'Minutes'),
        const SizedBox(width: 4),
        buildTimeCard(time: seconds, header: 'Seconds')
      ]
    );
  }
  Widget buildTimeCard({required String time,required String header}) => 
  Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[
      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child:Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize:40,
          ),
        ),
      ),
      const SizedBox(height:7),
      Text(header),
    ]
  );
}