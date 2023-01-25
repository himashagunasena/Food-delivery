import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/utils/app_constant.dart';

class PriceIncrease with ChangeNotifier {
  //PriceIncrease({required Products products, required int i}) : super(products: products,i: i);
  late double _counter = 0;
  double get getCounter => _counter;

  void addCounter(Products products, int i) {
    _counter = products.price;
    _counter + products.ingbtn[i].price;
    notifyListeners();
  }

  void clear(Products products) {
    _counter = products.price;
    notifyListeners();
  }

  int quantity = 1;

  int get getQuantity => quantity;

  // void clear() {
  //   quantity=0;
  //   notifyListeners();
  // }
  //increase counter
  // void Increase() {
  //   quantity++;
  //   notifyListeners();
  // }
  //
  // //decrease counter
  //
  // void Decrease() {
  //   //_counter = 0;
  //   if (quantity > 1) {
  //     quantity--;
  //     notifyListeners();
  //   } else {
  //     quantity = 1;
  //   }
  // }

  //increase counter
  void increaseCounter({
   required int i,
    required Products product,
  }) {
    _counter = _counter + product.ingbtn[i].price;

    notifyListeners();
  }
  //decrease counter

  void decreaseCounter({required Products product, required int i}) {
    //_counter = 0;
    _counter = _counter - product.ingbtn[i].price;
    notifyListeners();
  }
}

class ProviderName {
  final Products products;
  late int i;
  ProviderName({Key? key, required this.products, required this.i});
}
