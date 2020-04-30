import 'package:flutter/material.dart';
import 'package:media_query/dragpage.dart';
// import 'package:media_query/mainpage.dart';
// import 'package:media_query/stackpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragPage(),
    );
  }
}
