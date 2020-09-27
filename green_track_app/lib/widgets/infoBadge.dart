import 'package:flutter/material.dart';
import 'package:countup/countup.dart';
import 'dart:math';

class InfoBadgeNumber extends StatelessWidget {
  final int wholePart;
  final int decimalPart;
  final bool useDecimal;

  InfoBadgeNumber({this.wholePart, this.decimalPart, this.useDecimal});

  final int durationMultiplier = 100;
  final TextStyle infoBadgeNumberStyle = TextStyle(
    fontSize: 45,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Countup(
              begin: 0,
              end: wholePart.toDouble(),
              duration: Duration(
                  milliseconds: min(wholePart * durationMultiplier, 850)),
              separator: '.',
              style: infoBadgeNumberStyle,
            ),
            if (useDecimal) Text('.', style: infoBadgeNumberStyle),
            if (useDecimal)
              Countup(
                begin: 0,
                end: decimalPart.toDouble(),
                duration: Duration(
                    milliseconds: min(decimalPart * durationMultiplier, 850)),
                separator: '.',
                style: infoBadgeNumberStyle,
              ),
          ],
        )
      ],
    );
  }
}

class InfoBadge extends StatelessWidget {
  final int wholePart;
  final int decimalPart;
  final bool useDecimal;
  final String suffix;
  final bool smallSuffix;

  InfoBadge(
      {this.wholePart,
      this.decimalPart,
      this.useDecimal,
      this.suffix,
      this.smallSuffix = false});

  final TextStyle infoBadgeSuffixStyle = TextStyle(
    fontSize: 18,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  final TextStyle infoBadgeSmallSuffixStyle = TextStyle(
    fontSize: 15,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InfoBadgeNumber(
          wholePart: wholePart,
          decimalPart: decimalPart,
          useDecimal: useDecimal,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            suffix,
            style:
                !smallSuffix ? infoBadgeSuffixStyle : infoBadgeSmallSuffixStyle,
          ),
        )
      ],
    );
  }
}

class InfoBadgeInverted extends StatelessWidget {
  final String value;
  final String suffix;
  final bool smallSuffix;

  InfoBadgeInverted({
    this.value,
    this.suffix,
    this.smallSuffix = false,
  });

  final TextStyle infoBadgeNumberStyle = TextStyle(
    fontSize: 45,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w900,
    color: Color(0xff26FF97),
  );

  final TextStyle infoBadgeSuffixStyle = TextStyle(
      fontSize: 18,
      fontFamily: "Nunito Sans",
      fontWeight: FontWeight.w500,
      color: Colors.white);
  final TextStyle infoBadgeSmallSuffixStyle = TextStyle(
    fontSize: 15,
    fontFamily: "Nunito Sans",
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Opacity(
          opacity: 0.5,
          child: Text(
            suffix,
            style:
                !smallSuffix ? infoBadgeSuffixStyle : infoBadgeSmallSuffixStyle,
          ),
        ),
        Text(value, style: infoBadgeNumberStyle),
      ],
    );
  }
}
