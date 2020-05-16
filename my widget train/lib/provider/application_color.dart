import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// shared state

class ApplicationColor with ChangeNotifier {
  bool _isLightBlue = true;

  // get default color state
  bool get isLightBlue => _isLightBlue;

  // set the default color state
  set isLightBlue(bool value) {
    _isLightBlue = value;
    // to info the part that need to change
    notifyListeners();
  }

  // to set the color
  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;
}
