import 'package:flutter/material.dart';



class OffsetButton extends StatelessWidget {

  final callback;

  OffsetButton({this.callback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FlatButton(
        onPressed: () {
          if (callback != null) {
            callback(context);
          }
        },
        color: Color(0xffEAFFE0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 17),
          child: Text(
            "Offset CO₂",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w900,
              fontSize: 15
            ),
          ),
        )
      ),
    );
  }
}