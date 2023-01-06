import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  String _imagePath = 'assets/images/azul.png';
  double _size = 9.0;

  String get imagePath => _imagePath;
  set imagePath(String value) {
    _imagePath = value;
    notifyListeners();
  }

  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  }
}
