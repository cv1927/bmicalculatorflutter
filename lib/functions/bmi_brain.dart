import 'dart:math';

class BMIBrain {
  BMIBrain({this.height, this.weight}) {
    // _bmiResult = weight / ((height / 100) * (height / 100));
    _bmiResult = weight / pow((height / 100), 2);
    bmi = _bmiResult.toStringAsFixed(1);

    if (_bmiResult < 18.5) {
      category = 'Underweight';
      description = 'Must. Eat. More.';
    } else if (_bmiResult < 24.9) {
      category = 'Normal';
      description = 'Your BMI is normal. Nice!';
    } else if (_bmiResult < 29.9) {
      category = 'Overweight';
      description = 'Eat less. Exercise more!';
    } else {
      category = 'Obesity';
      description = 'Eat much less. Exercise much more!';
    }
  }

  final int height;
  final int weight;
  double _bmiResult; // _ --> makes it private!

  String category;
  String bmi;
  String description;
}