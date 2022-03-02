import 'package:flutter/material.dart';
import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/views/chart/chart.dart';



class WeightChart extends StatefulWidget {
  const WeightChart({Key? key}) : super(key: key);
  @override
  _WeightChartInState createState() => _WeightChartInState();
}




class _WeightChartInState extends State<WeightChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          header(context, isAppTitle: false, titleText: 'Weight Chart'),
      drawer: Drawer(
        child: sidenav(context),
      ),
      body:
       Center(
        child: Column(
          children: <Widget>[
            const Text(
                "Log your weight now!"),
            SizedBox(
              width: 200,
              child: Image.asset('../../../assets/tiger.png'),
            ),
            const Divider(
              color: Colors.deepPurpleAccent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: (){},
                  icon : Icon(Icons.camera_alt)
                ),
                IconButton(
                  icon : Icon(Icons.create_rounded),
                  onPressed: (){ openDialog(); } // (){openDialog}
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: bottom(),
    );
  }
  Future openDialog() => showDialog(
  context: context, 
  builder: (context)=> AlertDialog(
    title: Text('Your Weight'),
    content: TextField(
      autofocus: true,
      decoration: InputDecoration(hintText:'Enter your weight')
    ),
    actions: [
       TextButton(
        child: Text ('Cancel', style: TextStyle(
          color: Colors.red,
        )),
        onPressed:  Navigator.of(context).pop,
      ),
      TextButton(
        child: Text ('Log', style: TextStyle(
          color: Colors.deepPurpleAccent,
        )),
        onPressed:  Navigator.of(context).pop,
      ),
    ],
  ),
);

}

/*
Future openDialog() => showDialog(
  context: context, 
  builder: (context)=> AlertDialog(
    title: Text('Your Weight'),
    content: TextField(
      autofocus:true,
      decoration: InputDecoration(hintText:'Enter your weight')
    ),
    actions: [
      TextButton(
        child: Text ('SUBMIT');
        onPressed: submit,
      ),
    ],
  ),
);1

void submit() {
  Navigator.of(context).pop();
}*/

