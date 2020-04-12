import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey({Color colors, int soundNumber}) {
    return Expanded(
      child: FlatButton(
        color: colors,
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Xylphone"),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(colors: Colors.red, soundNumber: 1),
            buildKey(colors: Colors.orange, soundNumber: 2),
            buildKey(colors: Colors.green, soundNumber: 3),
            buildKey(colors: Colors.teal, soundNumber: 4),
            buildKey(colors: Colors.yellow, soundNumber: 5),
            buildKey(colors: Colors.blue, soundNumber: 6),
            buildKey(colors: Colors.purple, soundNumber: 7)
          ],
        )),
      ),
    );
  }
}
