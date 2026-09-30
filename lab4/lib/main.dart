import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Magic 8 Ball',
      home: BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  @override
  State<BallPage> createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  void shakeBall() {
    setState(() {
      ballNumber = Random().nextInt(8) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Magic 8 Ball',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 30.0),
            TextButton(
              onPressed: shakeBall,
              child: Image.asset(
                'assets/images/ball$ballNumber.png',
                width: 300.0,
                height: 300.0,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Tap the ball to ask a question!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white54,
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: shakeBall,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade900,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 15.0,
                ),
              ),
              child: Text(
                'SHAKE!',
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