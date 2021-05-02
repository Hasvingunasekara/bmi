import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BMIcalculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }

}

class BMIState extends State<BMIcalculator>{
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
        children: <Widget>[
          new Image.asset("images/download (2).png", height: 120.0 , width: 150.0,),
          new Container(color: Colors.grey[100], padding: const EdgeInsets.all(5.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new TextField(
                controller: _ageFieldController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Enter Age",
                  icon: new Icon(Icons.calendar_today),
                ),
              ),
              new TextField(
                controller: _heightFieldController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Height in feet",
                  icon: new Icon(Icons.info),
                ),
              ),
              new TextField(
                controller: _weightFieldController,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Weight in pounds",
                  icon: new Icon(Icons.shutter_speed),
                )
              ),
              new Padding(padding: const EdgeInsets.all(7.5)),
              new RaisedButton(onPressed: _calculatorBMI,
              child: new Text("CALCULATE",
              style: new TextStyle(fontWeight: FontWeight.bold),),
                color: Colors.purple [800],
                textColor: Colors.white,
              )
            ],
          ),
          ),
          new Padding(padding: const EdgeInsets.all(5.5)),
          new Container(
            alignment: Alignment.topCenter,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new  Text(_calResult != null ? "$_calResult" : "",
                style: new TextStyle(
                  color: Colors.pink,
                  fontSize: 44.5,
                  fontWeight: FontWeight.w800
                ),),
                new Text(_result != null ? _result : "" ,
                style: new TextStyle(
                  fontSize: 28.0
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}