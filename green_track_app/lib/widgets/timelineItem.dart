import 'package:flutter/material.dart';
import 'package:green_track_app/models/ParsedActivity.dart';
import 'package:green_track_app/services/analytics.dart';

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

  static TimelineItem fromActivity(ParsedActivity activity) {
    var category = activity.getCategory();
    return TimelineItem(
      color: category == "Neutral" ? Color(0xFF26FF97)
          : category == "Friendly" ? Color(0xFFE1FFE0)
          : Color(0xFFF13737),
      title: activity.type,
      subtitle: (activity.distance / 1000).toString() + "m",
      foregroundColor: Colors.white,
      height: 95.0 + activity.end.difference(activity.start).inHours * 20,
      emission: getEmissionForActivity(activity),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
      fontSize: 22,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w900,
      color: foregroundColor,
    );

    final TextStyle subtitleStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      fontFamily: "Montserrat",
      color: foregroundColor,
    );

    final TextStyle co2Style = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      fontFamily: "Montserrat",
      color: foregroundColor,
    );

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
