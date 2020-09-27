import 'package:flutter/material.dart';
import 'package:green_track_app/pages/DonatePage.dart';
import 'package:green_track_app/widgets/emojiBadge.dart';
import 'package:green_track_app/widgets/infoBadge.dart';
import 'package:green_track_app/widgets/colorSplitText.dart';
import 'package:green_track_app/widgets/offsetButton.dart';
import 'package:green_track_app/widgets/swipeUpIndicator.dart';

class HomePage extends StatefulWidget {
  final double co2Amount = 5.32;
  final int treeAmount = 7;
  final int percentageBetterThanAverage = 30;

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
            Container(height:100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoBadge(
                  wholePart: widget.co2Amount.truncate(),
                  decimalPart: int.parse(widget.co2Amount.toString().split(".")[1]),
                  useDecimal: true,
                  suffix: "test",
                ),
                InfoBadge(
                  wholePart: widget.treeAmount,
                  useDecimal: false,
                  suffix: "test",
                ),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: EmojiBadge(
                    mainText: "2.3km",
                    suffix: "kg CO₂",
                    level: 1,
                  ),
                ),
                EmojiBadge(
                  mainText: "2.3km",
                  suffix: "kg CO₂",
                  level: 2,
                ),
              ],
            ),
            Container(height: 30),
            ColorSplitText(
              color: Colors.red,
              size: 13,
              prefixText: "Your footprint is ",
              coloredText: widget.percentageBetterThanAverage.toString() + "% better",
              suffixText: " than the average",
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  OffsetButton(
                    callback: DonatePage.open,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:20.0),
                    child: SwipeUpIndicator(),
                  ),
                ],
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
