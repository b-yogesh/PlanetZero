import 'package:flutter/material.dart';
import 'package:green_track_app/SlideNavigation.dart';
import 'package:green_track_app/widgets/timeline.dart';
import 'package:green_track_app/widgets/timelineItem.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  SlideNavigation.goToHome();
                },
              ),
              Column(
                children: [
                  Timeline(
                    title: "Today",
                    height: 300,
                    children: [
                      TimelineItem(
                        title: "Walking",
                        subtitle: '650m',
                        height: 95,
                        color: Color(0xff26FF97),
                        emission: 0,
                      ),
                      TimelineItem(
                        title: "Public Transport",
                        subtitle: '3.2km',
                        height: 170,
                        color: Color(0xffE1FFE0),
                        emission: 0.3,
                      ),
                    ],
                  ),
                  Timeline(
                    title: "Yesterday",
                    height: 500,
                    children: [
                      TimelineItem(
                        title: "Car",
                        subtitle: '65.4km',
                        height: 250,
                        color: Color(0xffF13737),
                        emission: 6.5,
                      ),
                      TimelineItem(
                        title: "Walking",
                        subtitle: '1.3km',
                        height: 200,
                        color: Color(0xff26FF97),
                        emission: 0,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
