import 'package:flutter/material.dart';
import 'package:media_query/customProgressBar.dart';
// import 'package:media_query/bloc/bloc_color.dart';
// import 'package:media_query/bloc_withlibrary.dart';
// import 'package:media_query/timers.dart';
// import 'package:media_query/bloc_nolibrary.dart';
// import 'package:media_query/provider_state_multi.dart';
// import 'package:media_query/provide_state_management.dart';
// import 'package:media_query/animated_switcher.dart';
// import 'package:media_query/shared_pref.dart';
// import 'package:media_query/dragpage.dart';
// import 'package:media_query/hero_clipRRect.dart';
// import 'package:media_query/tabbar.dart';
// import 'package:media_query/mainpage.dart';
// import 'package:media_query/stackpage.dart';
// import 'package:media_query/clipPath.dart';
// import 'package:media_query/httpreq_post.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomProgBar(),
    );
  }
}
