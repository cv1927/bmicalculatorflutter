import 'package:flutter/material.dart';

import 'package:bmi_calculator/widgets/bmi_constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          color: kBottomContainerColour,
          margin: EdgeInsets.only(top: 5.0),
          padding: EdgeInsets.only(bottom: 5.0),
          width: double.infinity,
          height: kBottomContainerHeight,
          child: Center(
              child: Text(buttonTitle, style: kLargeButtonTextStyle,)
          )
      ),
    );
  }
}