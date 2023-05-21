import 'package:flutter/foundation.dart';

class ColorProvider with ChangeNotifier {
  double _colorVal = 1.0;

  // Getter
  double get getColorVal => _colorVal;

  // Setter
  void setColorVal(double val){
    _colorVal = val;
    notifyListeners();
  }

}