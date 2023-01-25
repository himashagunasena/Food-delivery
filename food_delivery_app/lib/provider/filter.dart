import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/utils/app_constant.dart';

class FilterItem with ChangeNotifier {


  //PriceIncrease({required Products products, required int i}) : super(products: products,i: i);
  late List<Products> filter = [];
  late List<Products> resturant = [];
  //UnmodifiableListView<> get allTasks => UnmodifiableListView(_tasks);
  List<Products> get getIndex => filter;
  List<Products> get getrest => resturant;

  void product(int i) {

    //int i = Data.productitem;
    for (int a = 0; a < Data.productitem.length; a++) {
      if (Data.productitem[a].category==Category.categoryItem[i].category) {
        filter.add(Data.productitem[a]);
        notifyListeners();
        //index++;
        //print();
      } else if (Category.categoryItem[i].category == 1) {
        filter.add(Data.productitem[a]);
        notifyListeners();
      } else{print("error");}
    }
    // filter.clear();
  }



  void commonProduct(){
    filter.clear();

  }

  void productClear(int i) {
    //_counter = 0;
    filter = [];
    notifyListeners();
  }

  void Resturentr(int i) {

    for (int a = 0; a < Data.productitem.length; a++) {
      if(Data.productitem[a].place==Data.productitem[i].place && Data.productitem[i].index!=Data.productitem[a].index){
        resturant.add(Data.productitem[a]);
        notifyListeners();
      }
    }
   // resturant = [];
    notifyListeners();
  }
}
