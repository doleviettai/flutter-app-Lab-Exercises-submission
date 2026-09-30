import 'package:flutter/material.dart';
import 'package:lab8/result_page.dart';
import 'calculator_brain.dart';


const Color activeCardColor = Color(0xFF1D1E33);
const Color inactiveCardColor = Color(0xFF111328);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedGender = Gender.male),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.male
                            ? activeCardColor
                            : inactiveCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.male, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text('MALE',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedGender = Gender.female),
                    child: Container(
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: selectedGender == Gender.female
                            ? activeCardColor
                            : inactiveCardColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.female, size: 80.0, color: Colors.white),
                          SizedBox(height: 15.0),
                          Text('FEMALE',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: activeCardColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                      style:
                      TextStyle(fontSize: 18.0, color: Colors.white54)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text('$height',
                          style: TextStyle(
                              fontSize: 50.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('cm',
                          style: TextStyle(
                              fontSize: 18.0, color: Colors.white54)),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) =>
                          setState(() => height = newValue.round()),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: activeCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.white54)),
                        Text('$weight',
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weightMinus',
                              mini: true,
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () =>
                                  setState(() => weight--),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              heroTag: 'weightPlus',
                              mini: true,
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () =>
                                  setState(() => weight++),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: activeCardColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                            style: TextStyle(
                                fontSize: 18.0, color: Colors.white54)),
                        Text('$age',
                            style: TextStyle(
                                fontSize: 50.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'ageMinus',
                              mini: true,
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () =>
                                  setState(() => age--),
                              child: Icon(Icons.remove, color: Colors.white),
                            ),
                            SizedBox(width: 10.0),
                            FloatingActionButton(
                              heroTag: 'agePlus',
                              mini: true,
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () =>
                                  setState(() => age++),
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
              CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(top: 10.0),
              color: Color(0xFFEB1555),
              width: double.infinity,
              height: 80.0,
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}