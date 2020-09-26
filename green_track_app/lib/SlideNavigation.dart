import 'package:flutter/material.dart';
import 'package:green_track_app/pages/HistoryPage.dart';
import 'package:green_track_app/pages/HomePage.dart';

class SlideNavigation extends StatelessWidget {
  static final PageController controller =
      PageController(initialPage: 0, keepPage: false);

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      scrollDirection: Axis.vertical,
      children: [
        HomePage(),
        HistoryPage(),
      ],
    );
  }

  static void goToHome() {
    controller.jumpToPage(0);
  }
}
