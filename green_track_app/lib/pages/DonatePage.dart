import 'package:flutter/material.dart';

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
      body: Container(
        child: Center(
          child: Column(
            children: [Text("hello world")],
          ),
        ),
      ),
    );
  }
}
