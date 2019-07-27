import 'package:flutter/material.dart';

import 'package:bmi_calculator/widgets/bmi_cards.dart';
import 'package:bmi_calculator/widgets/bmi_constants.dart';
import 'package:bmi_calculator/widgets/bmi_bottombutton.dart';

import 'package:bmi_calculator/functions/bmi_brain.dart';

class BMIResult extends StatelessWidget {
  BMIResult({this.calc});
  final BMIBrain calc;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result', style: kTitleTextStyle,),
              ),
          ),
          Expanded(
              flex: 5,
              child: CardBMI(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(calc.category.toUpperCase(), style: kResultTextStyle,),
                    Text(calc.bmi, style: kBMITextStyle,),
                    Text(calc.description,textAlign: TextAlign.center, style: kBodyTextStyle,),
                    //Text('Result', style: kResultTextStyle,),
                    //Text('28.0', style: kBMITextStyle,),
                    //Text('Description',textAlign: TextAlign.center, style: kBodyTextStyle,),
                  ],
                ),
              ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE'
          )
        ],
      ),
    );
  }
}
