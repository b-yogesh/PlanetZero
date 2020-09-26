import 'package:flutter/material.dart';



class EmojiBadge extends StatelessWidget {

  final int level;
  final String mainText;
  final String suffix;

  EmojiBadge({this.level, this.mainText, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Image(
            image: AssetImage("assets/backgrounds/emojiHappy.png"),
            fit:BoxFit.fill
          ),
          width: 20,
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top:7, bottom:0),
          child: Text(
            mainText,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Text(
          suffix,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}