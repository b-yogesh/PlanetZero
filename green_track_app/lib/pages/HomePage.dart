import 'package:flutter/material.dart';
import 'package:green_track_app/widgets/emojiBadge.dart';
import 'package:green_track_app/widgets/infoBadge.dart';

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
              children: [EmojiBadge()],
            )
          ],
        ),
      ),
    );
  }
}
