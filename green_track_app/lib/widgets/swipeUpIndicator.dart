import 'package:flutter/material.dart';

class SwipeUpIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.25,
          child: Image(
            image: AssetImage("assets/backgrounds/arrowUp.png"),
            width: 10,
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: Image(
            image: AssetImage("assets/backgrounds/arrowUp.png"),
            width: 14,
          ),
        ),
        Opacity(
          opacity: 0.75,
          child: Image(
            image: AssetImage("assets/backgrounds/arrowUp.png"),
            width: 17,
          ),
        ),
        Opacity(
          opacity: 1,
          child: Image(
            image: AssetImage("assets/backgrounds/arrowUp.png"),
            width: 20,
          ),
        ),
        Container(height: 8),
        Text(
          "Swipe Up",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontSize: 9,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
