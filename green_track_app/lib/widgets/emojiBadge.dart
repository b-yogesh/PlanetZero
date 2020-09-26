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
            image: level == 0 ? AssetImage("assets/backgrounds/emojiHappy.png") :
                  level == 1 ? AssetImage("assets/backgrounds/emojiNeutral.png") :
                  AssetImage("assets/backgrounds/emojiSad.png"),
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
              fontSize: 13,
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
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}