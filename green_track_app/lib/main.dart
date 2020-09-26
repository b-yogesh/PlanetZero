import 'package:flutter/material.dart';
import 'package:green_track_app/Navigation.dart';
import 'package:green_track_app/services/activityMonitor.dart';
import 'package:green_track_app/services/database.dart';

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
