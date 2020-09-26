import 'package:flutter/material.dart';
import 'package:green_track_app/pages/HomePage.dart';
import 'package:green_track_app/pages/HistoryPage.dart';
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
    return PageView(
      scrollDirection: Axis.vertical,
      children: [
        HomePage(),
        HistoryPage(),
      ],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                EmojiBadge(
                  mainText: "2.3km",
                  suffix: "kg CO₂",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
