import 'package:flutter/material.dart';

// for this tabbar widget, don't know why the icon with text only can put in 1 tab only
// if there are another icon with text it's show bug

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab bar widget'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                child: Image(
                  image: NetworkImage(
                      "http://clipart-library.com/new_gallery/37-373099_chick-yellow-yellowchick-tumblr-aesthetic-cute-kawaii-cute.png"),
                ),
              ),
              Tab(
                child: Icon(Icons.settings),
              ),
              Tab(
                text: "Comments",
              ),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          Center(
            child: Text('Tab Home'),
          ),
          Center(
            child: Text('Tab Cute'),
          ),
          Center(
            child: Text('Tab Settings'),
          ),
          Center(
            child: Text('Tab Comments'),
          ),
        ]),
      ),
    );
  }
}
