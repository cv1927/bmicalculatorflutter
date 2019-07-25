import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/widgets/bmi_cards.dart';
import 'package:bmi_calculator/widgets/bmi_icon_content.dart';
import 'package:bmi_calculator/widgets/bmi_constants.dart';
import 'package:bmi_calculator/widgets/bmi_bottombutton.dart';
import 'package:bmi_calculator/widgets/bmi_round_button.dart';

import 'package:bmi_calculator/enums/enum_gender_bmi.dart';

import 'package:bmi_calculator/functions/bmi_brain.dart';

class BMIMenu extends StatefulWidget {
  @override
  _BMIMenuState createState() => _BMIMenuState();

}

class _BMIMenuState extends State<BMIMenu> {
  @override
  Widget build(BuildContext context) {
    return _ContentBMIMenu();
  }
}

class _ContentBMIMenu extends StatefulWidget {
  @override
  __ContentBMIMenuState createState() => __ContentBMIMenuState();
}

class __ContentBMIMenuState extends State<_ContentBMIMenu> {
  BMI_Calculator_Gender selectedGender;
  int height = 180;
  int weight = 70;
  int age = 18;

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
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newHeight) {
                          setState(() {
                            height = newHeight.round();
                          });
                        },
                    ),
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
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('WEIGHT', style: kLabelTextStyle,),
                          Text('$weight', style: kNumberTextStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 10.0,),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: FontAwesomeIcons.plus
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                  child: CardBMI(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Age', style: kLabelTextStyle,),
                        Text('$age', style: kNumberTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus,color: kIconFloatinButton,),
                              backgroundColor: kFloatinButton,
                              elevation: 0.0,
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus,color: kIconFloatinButton,),
                              backgroundColor: kFloatinButton,
                              elevation: 0.0,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          BottomButton(
            onTap: () {
              BMIBrain calc = BMIBrain(height: height,weight: weight);
              Navigator.pushNamed(context, '/results', arguments: calc);
            },
            buttonTitle: 'CALCULATE',
          )
        ],
      ),
    );
  }
}

