import 'package:flutter/material.dart';

class ProductNotifer extends ChangeNotifier {
  int _activepage = 0;
  List<dynamic> _shoesSize = [];
  int get activepage => _activepage;

  set activepage(int newIndex) {
    _activepage = newIndex;
    notifyListeners();
  }

  List<dynamic> get shoesSize => _shoesSize;

  set shoesSize(List<dynamic> newSize) {
    _shoesSize = newSize;
    notifyListeners();
  }

  // function is called with an index , it will toggle the selection
  // of that item and leaves the selection of all other items as they were .
  //This will allow for multiple items to  be selected at once .

  void toggleCheck(int index) {
    for (int i = 0; i < _shoesSize.length; i++) {
      if (i == index) {
        _shoesSize[i]["isSelected"] = !_shoesSize[i]["isSelected"];
      }
    }
    notifyListeners();
  }
}
