import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  IconContent({this.iconData, this.labelText});

  final IconData iconData;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 60.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          labelText,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.0
          ),
        )
      ],
    );
  }
}