import 'package:flutter/material.dart';
// import 'package:media_query/dragpage.dart';
// import 'package:media_query/hero_clipRRect.dart';
// import 'package:media_query/tabbar.dart';
// import 'package:media_query/mainpage.dart';
// import 'package:media_query/stackpage.dart';
// import 'package:media_query/clipPath.dart';
import 'package:media_query/httpreq_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HTTPReq(),
    );
  }
}
