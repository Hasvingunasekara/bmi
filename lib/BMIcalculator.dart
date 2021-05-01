import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIcalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIcalculator();
  }

}

class BMIcalculator extends State<BMIcalculator>{
  double _calculation;
  String _calResult;
  String _result;

  TextEditingController _ageFieldController = new TextEditingController();
  TextEditingController _heightFieldController = new TextEditingController();
  TextEditingController _weightFieldController = new TextEditingController();

  void _calculatorBMI(){
    double heights = double.parse(_heightFieldController.text);
    double weight = double.parse(_weightFieldController.text);

    if (heights != null && weight!= null){
      setState(() {
        heights = heights * 12;
        _calculation = (weight/(heights * heights))* 703;
        _calResult = _calculation.toStringAsFixed(2);
        if (_calculation < 18.5){
          _result = "UNDERWEIGHT";
        } else if (_calculation >= 18.5 && _calculation <= 24.9){
          _result = "GOOD FIT";
        } else if (_calculation >= 25.0 && _calculation <= 29.9){
          _result = "OVERWEIGHT";
        } else {
          _result = "OBESE";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.purple [800], title: new Text("BMI Calculator"),),
      body: new ListView(
        padding: const EdgeInsets.all(3.5),

      ),
    );
  }
}