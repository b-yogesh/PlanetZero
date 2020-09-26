import 'package:flutter/material.dart';
import 'package:green_track_app/SlideNavigation.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();

  static void open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonatePage()),
    );
  }
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text("hello world")
            ],
          ),
        ),
      ),
    );
  }
}
