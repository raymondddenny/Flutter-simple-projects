import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.deepOrange,
          appBar: AppBar(
            title: Text("I am poor"),
            backgroundColor: Colors.deepOrange[900],
          ),
          body: Center(
            child: Image(image: AssetImage('images/coal.png')),
          ),
        ),
      ),
    );
