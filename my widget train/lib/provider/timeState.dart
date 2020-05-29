import 'package:flutter/material.dart';

class TimeState with ChangeNotifier {
  int _time = 10;

  int get time => _time;

  set time(int newTime) {
    _time = newTime;
    notifyListeners();
  }
}
