import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/widgets/bmi_cards.dart';
import 'package:bmi_calculator/widgets/bmi_icon_content.dart';

const backgroundAppColour = Color(0xFF0A0E21);
const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;

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
        backgroundColor: backgroundAppColour,
        scaffoldBackgroundColor: backgroundAppColour,
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
  Color maleCardColour = inactiveCardColour;
  Color femaleCardColour = inactiveCardColour;

  //1 = male, 2 = female
  void updateColour(int gender) {
    if (gender == 1) {
      if (maleCardColour == inactiveCardColour) {
        maleCardColour = activeCardColour;
        femaleCardColour = inactiveCardColour;
      }else {
        maleCardColour = inactiveCardColour;
      }
    }else if(gender == 2) {
      if (femaleCardColour == inactiveCardColour) {
        femaleCardColour = activeCardColour;
        maleCardColour = inactiveCardColour;
      }else{
        femaleCardColour = inactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title:  Text('BMI CALCULATOR'),
         centerTitle: true,
       ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(1);
                      });
                    },
                    child: CardBMI(
                      colour: maleCardColour,
                      cardChild: IconContent(
                          iconData: FontAwesomeIcons.mars,
                          labelText: 'MALE'
                      )
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(2);
                      });
                    },
                    child: CardBMI(
                      colour: femaleCardColour,
                      cardChild: IconContent(
                          iconData: FontAwesomeIcons.venus,
                          labelText: 'FEMALE'
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: CardBMI(
                colour: activeCardColour
            )
          ),

          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: CardBMI(
                      colour: activeCardColour,
                    )
                ),
                Expanded(
                  child: CardBMI(
                      colour: activeCardColour
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: bottomContainerColour,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}

