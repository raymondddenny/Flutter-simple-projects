import 'package:flutter/material.dart';

//Main function fungsi sebagai starting point in flutter apps
void main() => runApp(
//  in main the command is to run app, the material App
      MaterialApp(
//        material app contain Center Widget, yang berisi Text widget ("Hello Denny")
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
          appBar: AppBar(
            title: Text("I am Rich"),
            backgroundColor: Colors.blueGrey[900],
          ),
          body: Center(
            child: Image(
              image: AssetImage('images/diamond.png'),
            ),
          ),
        ),
      ),
    );
