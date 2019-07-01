import 'package:flutter/material.dart';

import 'package:bmi_calculator/pages/bmi_menu.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BMIMenu();
  }
}
