import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  TabBar tabb = TabBar(
    // to change the tab bar indicator color
    indicatorColor: Colors.blue,
    tabs: <Widget>[
      Tab(
        icon: Icon(Icons.home),
        text: "Home",
      ),
      Tab(
        icon: Icon(Icons.settings),
        text: "Settings",
      ),
      Tab(
        icon: Icon(Icons.comment),
        text: "Comments",
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab bar widget'),
          bottom: PreferredSize(
              //to set the tab bar color, we need to set container to bottom : then wrap with preferedSize widget
              //to get the size of our tab bar
              preferredSize: Size.fromHeight(tabb.preferredSize.height),
              child: Container(color: Colors.green, child: tabb)),
        ),
        body: TabBarView(children: <Widget>[
          Center(
            child: Text('Tab Home'),
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
