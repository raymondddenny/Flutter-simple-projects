import 'package:flutter/material.dart';

class StockState with ChangeNotifier {
  int _stock = 10;

  int get stock => _stock;
  set stock(int newStock) {
    _stock = newStock;
    notifyListeners();
  }
}
