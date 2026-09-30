import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('🎲 Dice Roll'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset(
                      'assets/images/dice$leftDiceNumber.png',
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: rollDice,
                    child: Image.asset(
                      'assets/images/dice$rightDiceNumber.png',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
              ),
              child: Text(
                'ROLL DICE',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}