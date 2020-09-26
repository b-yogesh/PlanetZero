import 'package:flutter/material.dart';
import 'package:green_track_app/pages/HistoryPage.dart';
import 'package:green_track_app/pages/HomePage.dart';

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
