import 'package:e_commers/Models/sneakers_models.dart';
import 'package:e_commers/Servicers/helper.dart';
import 'package:flutter/material.dart';

class ProductNotifer extends ChangeNotifier {
  int _activepage = 0;
  List<dynamic> _shoesSize = [];
  List<String> _sizes = [];
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
  
List<String> get sizes => _sizes;

set sizes(List<String> newSizes) {
  _sizes = newSizes;
   notifyListeners();
}

 late Future<List<Sneakers>> male;
  late Future<List<Sneakers>> female;
  late Future<List<Sneakers>> kids;
  late Future<Sneakers> sneaker;

  void getMale() {
    male = Helper().getMaleSneakers();
  }

  void getFemale() {
    female = Helper().getFemaleSneakers();
  }

  void getKids() {
    kids = Helper().getKidsSneakers();
  }

//  late Future<Sneakers> _sneaker;
  void getShoes(String category,String id) {
    if (category == "Men's Running") {
      sneaker = Helper().getMensSneakersById(id);
    } else if (category == "Women's Running") {
      sneaker = Helper().getWomenSneakersById(id);
    } else {
      sneaker = Helper().getKidsSneakersById(id);
    }
  }

}
