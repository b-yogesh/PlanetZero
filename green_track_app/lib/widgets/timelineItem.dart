import 'package:flutter/material.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final double emission;
  final Color color;
  final Color foregroundColor;
  final double height;

  TimelineItem({
    this.title,
    this.subtitle,
    this.color,
    this.foregroundColor,
    this.emission,
    this.height,
  });

  final TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
  );

  final TextStyle subtitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w200,
    fontFamily: "Montserrat",
  );

  final TextStyle co2Style = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w200,
    fontFamily: "Montserrat",
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: new BoxDecoration(
          color: color,
          borderRadius: new BorderRadius.all(Radius.circular(10.0)),
        ),
        width: width - 70,
        height: height,
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleStyle),
                  Container(height: 14),
                  Text(subtitle, style: subtitleStyle),
                ],
              ),
            ),
            Column(
              children: [
                Text(emission.toString(), style: co2Style),
                Text("kg CO₂", style: subtitleStyle),
              ],
            ),
            Container(width: 5),
          ],
        ));
  }
}
