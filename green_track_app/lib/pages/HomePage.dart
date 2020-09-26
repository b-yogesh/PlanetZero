import 'package:flutter/material.dart';
import 'package:green_track_app/pages/DonatePage.dart';
import 'package:green_track_app/widgets/emojiBadge.dart';
import 'package:green_track_app/widgets/infoBadge.dart';
import 'package:green_track_app/widgets/colorSplitText.dart';
import 'package:green_track_app/widgets/offsetButton.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InfoBadge(
                  wholePart: 3,
                  decimalPart: 4,
                  useDecimal: true,
                  suffix: "test",
                ),
                // InfoBadge(
                //   wholePart: 7,
                //   useDecimal: false,
                //   suffix: "test",
                // ),
              ],
            ),
            Container(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmojiBadge(
                  mainText: "2.3km",
                  suffix: "kg CO₂",
                  level: 0,
                ),
                EmojiBadge(
                  mainText: "2.3km",
                  suffix: "kg CO₂",
                  level: 1,
                ),
                EmojiBadge(
                  mainText: "2.3km",
                  suffix: "kg CO₂",
                  level: 2,
                ),
              ],
            ),
            Container(height: 50),
            ColorSplitText(
              color: Colors.red,
              size: 13,
              prefixText: "Your footprint is ",
              coloredText: "30% better",
              suffixText: " then the average",
            ),
            OffsetButton(
              callback: DonatePage.open,
            )
          ],
        ),
      ),
    );
  }
}
