import 'package:flutter/material.dart';

class AnimatedSwitchers extends StatefulWidget {
  @override
  _AnimatedSwitchersState createState() => _AnimatedSwitchersState();
}

class _AnimatedSwitchersState extends State<AnimatedSwitchers> {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Switcher"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedSwitcher(
                // fade in animation
                child: myWidget,
                duration: Duration(seconds: 1),
              ),
              Switch(
                activeColor: Colors.orange,
                inactiveTrackColor: Colors.red,
                value: isOn,
                onChanged: (newValue) {
                  isOn = newValue;
                  setState(() {
                    // check if isOn change
                    if (isOn) {
                      myWidget = Container(
                        key: ValueKey(1),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            border: Border.all(color: Colors.black12, width: 3),
                            borderRadius: BorderRadius.circular(20)),
                      );
                    } else {
                      myWidget = Container(
                        key: ValueKey(2),
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.black12, width: 3),
                            borderRadius: BorderRadius.circular(20)),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myWidget = Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
      color: Colors.red,
      border: Border.all(color: Colors.black12, width: 3),
      borderRadius: BorderRadius.circular(20)),
);
