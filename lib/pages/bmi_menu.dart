import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/widgets/bmi_cards.dart';
import 'package:bmi_calculator/widgets/bmi_icon_content.dart';
import 'package:bmi_calculator/widgets/bmi_constants.dart';

import 'package:bmi_calculator/enums/enum_gender_bmi.dart';

class BMIMenu extends StatefulWidget {
  @override
  _BMIMenuState createState() => _BMIMenuState();

}

class _BMIMenuState extends State<BMIMenu> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundAppColour,
        scaffoldBackgroundColor: kBackgroundAppColour,
      ),
      home: _ContentBMIMenu(),
    );
  }
}

class _ContentBMIMenu extends StatefulWidget {
  @override
  __ContentBMIMenuState createState() => __ContentBMIMenuState();
}

class __ContentBMIMenuState extends State<_ContentBMIMenu> {
  BMI_Calculator_Gender selectedGender;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:  Text('BMI CALCULATOR'),
         centerTitle: true,
       ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CardBMI(
                    onPress: () {
                      setState(() {
                        selectedGender = BMI_Calculator_Gender.Male;
                      });
                    },
                    colour: //maleCardColour
                      selectedGender == BMI_Calculator_Gender.Male ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.mars,
                        labelText: 'MALE'
                    )
                  ),
                ),
                Expanded(
                  child: CardBMI(
                    onPress: () {
                      setState(() {
                        selectedGender = BMI_Calculator_Gender.Female;
                      });
                    },
                    colour: //femaleCardColour
                      selectedGender == BMI_Calculator_Gender.Female ? kActiveCardColour : kInactiveCardColour,
                    cardChild: IconContent(
                        iconData: FontAwesomeIcons.venus,
                        labelText: 'FEMALE'
                    )
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: CardBMI(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                  )
                ],
              ),
            )
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: CardBMI(
                      colour: kActiveCardColour,
                    )
                ),
                Expanded(
                  child: CardBMI(
                      colour: kActiveCardColour
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: kBottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}

