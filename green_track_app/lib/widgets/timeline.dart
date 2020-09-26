import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';

class Timeline extends StatelessWidget {
  final String title;
  final double height;
  final List<Widget> children;

  Timeline({this.title, this.height, this.children});

  final TextStyle titleStyle = TextStyle(
    fontSize: 16,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    color: Colors.grey,
  );

  @override
  Widget build(BuildContext context) {
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
                  lineThickness: 5,
                  dashLength: 15,
                  dashGapLength: 12,
                  dashRadius: 5,
                ),
                Container(width: 20),
                Column(
                  children: children,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
