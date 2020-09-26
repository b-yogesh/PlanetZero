import 'package:flutter/material.dart';
import 'package:green_track_app/widgets/offsetingPost.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();

  static void open(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonatePage()),
    );
  }
}

class _DonatePageState extends State<DonatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0, right:5),
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
              OffsettingPost(
                bulletPoints: [
                  "test 1",
                  "test 2",
                  "test 3 tespij psjep jpfojespo jfpsejp ofepf feopsj foejsofp joüsjf eü esjü"
                ],
                name: "test name 1",
                imageUrl: "https://picsum.photos/250?image=9",
                learnMoreUrl: "https://www.google.com",
                offsetUrl: "https://www.google.com",
              ),
              OffsettingPost(
                bulletPoints: [
                  "test 1",
                  "test 2",
                  "test 3 tespij psjep jpfojespo jfpsejp ofepf feopsj foejsofp joüsjf eü esjü"
                ],
                name: "test name 2",
                imageUrl: "https://picsum.photos/250?image=9",
                learnMoreUrl: "https://www.google.com",
                offsetUrl: "https://www.google.com",
              ),
              OffsettingPost(
                bulletPoints: [
                  "test 1",
                  "test 2",
                  "test 3 tespij psjep jpfojespo jfpsejp ofepf feopsj foejsofp joüsjf eü esjü"
                ],
                name: "test name 3",
                imageUrl: "https://picsum.photos/250?image=9",
                learnMoreUrl: "https://www.google.com",
                offsetUrl: "https://www.google.com",
              ),
              Container(height:5)
            ],
          ),
        ),
      ),
    );
  }
}
