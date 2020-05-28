import 'dart:async';

import 'package:flutter/material.dart';

class Timers extends StatefulWidget {
  @override
  _TimersState createState() => _TimersState();
}

class _TimersState extends State<Timers> {
  bool isEnable = false;
  bool isStop = true;
  bool isGreen = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counter.toString(),
              style: TextStyle(
                  color: (isGreen) ? Colors.green : Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Timer(Duration(seconds: 4), () {
                  setState(() {
                    isGreen = !isGreen;
                  });
                });
              },
              child: Text("Ubah warna 4 detik kemudian.."),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                counterIncrement();
              },
              child: Text("Start timer"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                isStop = true;
                setState(() {
                  counter = 0;
                });
              },
              child: Text("Stop timer"),
            ),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Timer.run(() {
                  setState(() {
                    isGreen = !isGreen;
                  });
                });
              },
              child: Text("Ubah warna langsung"),
            ),
          ],
        ),
      ),
    );
  }

  void counterIncrement() {
    counter = 0;
    isStop = false;
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (isStop) {
        timer.cancel();
      }

      setState(() {
        counter++;
        isEnable = true;
      });
    });
  }
}
