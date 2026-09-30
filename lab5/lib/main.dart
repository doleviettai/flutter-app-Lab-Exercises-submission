import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: XylophonePage(),
    );
  }
}

class XylophonePage extends StatelessWidget {
  final AudioPlayer player = AudioPlayer();

  void playSound(int noteNumber) async {
    await player.stop();
    await player.play(AssetSource('sounds/note$noteNumber.wav'));
  }

  Widget buildKey({required Color color, required int noteNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        onPressed: () => playSound(noteNumber),
        child: SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('🎵 Xylophone'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildKey(color: Colors.red,        noteNumber: 1),
            buildKey(color: Colors.orange,     noteNumber: 2),
            buildKey(color: Colors.yellow,     noteNumber: 3),
            buildKey(color: Colors.green,      noteNumber: 4),
            buildKey(color: Colors.teal,       noteNumber: 5),
            buildKey(color: Colors.blue,       noteNumber: 6),
            buildKey(color: Colors.purple,     noteNumber: 7),
          ],
        ),
      ),
    );
  }
}