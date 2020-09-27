import 'package:flutter/material.dart';
import 'package:green_track_app/SlideNavigation.dart';
import 'package:green_track_app/models/ParsedActivity.dart';
import 'package:green_track_app/widgets/colorSplitText.dart';
import 'package:green_track_app/widgets/infoBadge.dart';
import 'package:green_track_app/widgets/timeline.dart';
import 'package:green_track_app/widgets/timelineItem.dart';
import 'package:green_track_app/services/measurementParser.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  ParsedActivity _currentActivity;

  final TextStyle infoBadgeTitleTextStyle = TextStyle(
    color: Colors.white,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w700,
    fontSize: 15,
  );

  initState() async {
    super.initState();
    var currentActivity = await parseMeasurementsAndGetCurrent();
    setState(() {
      _currentActivity = currentActivity;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.transparent,
                      const Color(0xFF003333),
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 5),
                        child: IconButton(
                          icon: Icon(Icons.close),
                          color: Colors.white,
                          onPressed: () {
                            SlideNavigation.goToHome();
                          },
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(height: 20),
                          Text("Rank", style: infoBadgeTitleTextStyle),
                          Container(height: 10),
                          InfoBadgeInverted(
                            wholePart: 1,
                            decimalPart: 2,
                            useDecimal: true,
                            suffix: "top",
                            smallSuffix: true,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Yearly", style: infoBadgeTitleTextStyle),
                          Container(height: 10),
                          InfoBadge(
                            wholePart: 1,
                            decimalPart: 2,
                            useDecimal: true,
                            suffix: "kg CO₂",
                            smallSuffix: true,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(height: 20),
                          Text("Monthly", style: infoBadgeTitleTextStyle),
                          Container(height: 10),
                          InfoBadgeInverted(
                            wholePart: 1,
                            decimalPart: 2,
                            useDecimal: true,
                            suffix: "improved",
                            smallSuffix: true,
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ColorSplitText(
                              color: Color(0xff26FF97),
                              size: 13,
                              prefixText: "",
                              coloredText: "Best month",
                              suffixText: " out of the last four.",
                            ),
                            Container(height: 20),
                            ColorSplitText(
                              color: Color(0xff26FF97),
                              size: 13,
                              prefixText: "",
                              coloredText: "30% better",
                              suffixText: " than the average user.",
                            ),
                            Container(height: 20),
                            ColorSplitText(
                              color: Colors.orange,
                              size: 13,
                              prefixText: "",
                              coloredText: "3% worse",
                              suffixText: " than last week.",
                            ),
                            Container(height: 30),
                            ColorSplitText(
                              color: Colors.orange,
                              size: 13,
                              prefixText: "",
                              coloredText: "",
                              suffixText: "Improve by 0.3kg to level up.",
                            ),
                            Container(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(height: 20),
                  Column(
                    children: [
                      Timeline(
                        title: "Today",
                        children: [
                          TimelineItem(
                            title: "Walking",
                            subtitle: '650m',
                            height: 95,
                            color: Color(0xff26FF97),
                            foregroundColor: Colors.black,
                            emission: 0,
                          ),
                          TimelineItem(
                            title: "Public Transport",
                            subtitle: '3.2km',
                            height: 170,
                            color: Color(0xffE1FFE0),
                            foregroundColor: Colors.black,
                            emission: 0.3,
                          ),
                        ],
                      ),
                      Timeline(
                        title: "Yesterday",
                        children: [
                          TimelineItem(
                            title: "Car",
                            subtitle: '65.4km',
                            height: 250,
                            color: Color(0xffF13737),
                            foregroundColor: Colors.white,
                            emission: 6.5,
                          ),
                          TimelineItem(
                            title: "Walking",
                            subtitle: '1.3km',
                            height: 200,
                            color: Color(0xff26FF97),
                            foregroundColor: Colors.black,
                            emission: 0,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
