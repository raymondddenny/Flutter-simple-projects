import 'package:flutter/material.dart';
import 'package:media_query/provider/application_color.dart';
import 'package:provider/provider.dart';

class MyApps extends StatelessWidget {
  bool isOn = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Consumer<ApplicationColor>(
            builder: (context, applicationColor, _) => Text(
              "provider state management",
              style: TextStyle(color: applicationColor.color),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(5),
                  color: applicationColor.color,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.all(5), child: Text("ab")),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Switch(
                      value: applicationColor.isLightBlue,
                      onChanged: (newValue) {
                        applicationColor.isLightBlue = newValue;
                      },
                    ),
                  ),
                  Container(margin: EdgeInsets.all(5), child: Text("lb")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
