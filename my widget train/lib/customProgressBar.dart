import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media_query/provider/timeState.dart';
import 'package:provider/provider.dart';

class CustomProgBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom progress bar"),
      ),
      body: Center(
        child: ChangeNotifierProvider<TimeState>(
          create: (context) => TimeState(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<TimeState>(
                builder: (context, timeState, _) => CustomProgressBar(
                  width: 200,
                  value: timeState.time,
                  totalValue: 10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Consumer<TimeState>(
                builder: (context, timeState, _) => RaisedButton(
                  color: Colors.lightGreen,
                  child: Text(
                    "Start timer",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Timer.periodic(Duration(seconds: 1), (timer) {
                      if (timeState.time == 0) {
                        timer.cancel();
                      } else {
                        timeState.time -= 1;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget {
  final double width; // untuk lebar
  final int value; //nilai yang terisi
  final int totalValue; // nilai max progress bar

// constructor
  CustomProgressBar({this.width, this.value, this.totalValue});
  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.timelapse),
        SizedBox(
          width: 10,
        ),
        Stack(
          children: [
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              child: AnimatedContainer(
                height: 10,
                width: width * ratio,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                  color: (ratio < 0.3)
                      ? Colors.red
                      : (ratio < 0.6) ? Colors.amber : Colors.lightGreen,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
