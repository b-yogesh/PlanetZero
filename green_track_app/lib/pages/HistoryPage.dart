import 'package:flutter/material.dart';
import 'package:green_track_app/SlideNavigation.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
                SlideNavigation.goToHome();
              },
            ),
            Center(
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
