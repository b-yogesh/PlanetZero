import 'package:flutter/material.dart';

class InfoBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('3.6'),
        Text('kg CO²'),
      ],
    );
  }
}
