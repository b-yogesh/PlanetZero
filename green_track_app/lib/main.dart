import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_track_app/SlideNavigation.dart';
import 'package:green_track_app/services/activityMonitor.dart';
import 'package:green_track_app/services/database.dart';

void main() async {
  await initDatabase();
  startActivityMonitor();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.black));

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
      home: SlideNavigation(),
    );
  }
}
