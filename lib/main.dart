import 'package:flutter/material.dart';

import 'package:bmi_calculator/widgets/bmi_constants.dart';

import 'package:bmi_calculator/pages/bmi_menu.dart';
import 'package:bmi_calculator/pages/bmi_result.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: kBackgroundAppColour,
        scaffoldBackgroundColor: kBackgroundAppColour,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BMIMenu(),
        '/results': (context) => BMIResult()
      },
    );
  }
}
