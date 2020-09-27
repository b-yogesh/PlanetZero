import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:green_track_app/widgets/timelineItem.dart';

class Timeline extends StatelessWidget {
  final String title;
  final List<TimelineItem> children;

  Timeline({this.title, this.children});

  final TextStyle titleStyle = TextStyle(
    fontSize: 12,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w700,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
    var height = max<double>(100.0, children.fold(0, (prev, curr) => prev + curr.height + 15));
    return Row(
      children: [
        Container(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: titleStyle),
            Container(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DottedLine(
                  dashColor: Colors.grey,
                  direction: Axis.vertical,
                  lineLength: height,
                  lineThickness: 4,
                  dashLength: 10,
                  dashGapLength: 12,
                  dashRadius: 5,
                ),
                Container(width: 20),
                Column(
                  children: children,
                ),
              ],
            ),
            Container(height: 10)
          ],
        )
      ],
    );
  }
}
