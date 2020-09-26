import 'package:flutter/material.dart';



class ColorSplitText extends StatelessWidget {

  final Color color;
  final String prefixText;
  final String coloredText;
  final String suffixText;
  final double size;

  ColorSplitText({this.color, this.prefixText, this.coloredText, this.suffixText, this.size});

  @override
  Widget build(BuildContext context) {

    TextStyle defaultTextStyle = TextStyle(
      color: Colors.white,
      fontFamily: "Nunito Sans",
      fontWeight: FontWeight.w700,
      fontSize: size
    );

    TextStyle coloredTextStyle = TextStyle(
      color: color,
      fontFamily: "Nunito Sans",
      fontWeight: FontWeight.w900,
      fontSize: size+1
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            if (prefixText != null && prefixText != "") TextSpan(
              text: prefixText,
              style: defaultTextStyle
            ),
            if (coloredText != null && coloredText != "") TextSpan(
              text: coloredText,
              style: coloredTextStyle
            ),
            if (suffixText != null && suffixText != "") TextSpan(
              text: suffixText,
              style: defaultTextStyle
            )
          ]
        ),
      ),
    );
  }
}