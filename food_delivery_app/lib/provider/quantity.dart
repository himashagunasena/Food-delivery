import 'package:flutter/cupertino.dart';

class Quantity with ChangeNotifier {

  int quantity = 1;
  int get getQuantity => quantity;

  void clear() {
    quantity=1;
    notifyListeners();
  }
  //increase counter
  void Increase() {
    quantity++;
    notifyListeners();
  }
  //decrease counter

  void Decrease(){
    //_counter = 0;
    if (quantity>1){
    quantity--;
    notifyListeners();}else{quantity=1;}
  }
}
