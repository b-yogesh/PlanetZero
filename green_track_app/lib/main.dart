import 'package:flutter/material.dart';
import 'package:green_track_app/services/activityMonitor.dart';
import 'package:green_track_app/services/database.dart';

import 'package:green_track_app/widgets/infoBadge.dart';
import 'package:green_track_app/widgets/emojiBadge.dart';

void main() async {
  await initDatabase();
  startActivityMonitor();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Navigation(),
    );
  }
}

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        scrollDirection: Axis.vertical,
        children: [
          MyHomePage(),
          Container(
            color: Colors.cyan,
            child: SingleChildScrollView(
              child: Text("fd ffdk"),
            ),
          ),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage("assets/backgrounds/1.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoBadge(
                  wholePart: 3,
                  decimalPart: 4,
                  useDecimal: true,
                  suffix: "test",
                ),
                // InfoBadge(
                //   wholePart: 7,
                //   useDecimal: false,
                //   suffix: "test",
                // ),
              ],
            ),
            Container(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmojiBadge()
              ],
            )
          ],
        ),
      ),
    );
  }
}
