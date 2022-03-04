import 'package:flutter/material.dart';
import 'package:gym_pal/widgets/header.dart';
import 'package:gym_pal/widgets/sidenav.dart';
import 'package:gym_pal/widgets/bottom.dart';
import 'package:gym_pal/views/chart/chart2.dart';



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
            const Text("Weight Chart",textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold)),
             const Text("Last 8 months"),
            SizedBox(
              width: 400,
              height:200,
              child: SimpleBarChart.withoutData(false),
            ),
            const Text("Log your weight now!"),
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
                  onPressed: (){SimpleBarChart.withoutData(false);},
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
          color: Color.fromARGB(255, 37, 34, 34),
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


