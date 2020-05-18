import 'package:flutter/material.dart';

class MyApps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multi Provider"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Balance"),
                Container(
                  height: 30,
                  width: 150,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(color: Colors.amber, width: 5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
