// import 'package:scoped_model/scoped_model.dart';
//
// import 'data.dart';
//
//
//
//
// class CartModel extends Model {
//   List<Products> cart = [];
//   double totalCartValue = 0;
//
//   int get total => cart.length;
//
//   void addProduct(product) {
//     int index = cart.indexWhere((i) => i.index == product.id);
//     print(index);
//     // if (index != -1)
//     //   // updateProduct(product, product.qty + 1);
//     // else {
//     //   cart.add(product);
//     //   calculateTotal();
//      notifyListeners();
//     // }
//   }
//
//   void removeProduct(product) {
//     int index = cart.indexWhere((i) => i.index == product.id);
//    // cart[index].qty = 1;
//     cart.removeWhere((item) => item.index == product.id);
//     calculateTotal();
//     notifyListeners();
//   }
//
//   // void updateProduct(product, qty) {
//   //   int index = cart.indexWhere((i) => i.id == product.id);
//   //   cart[index].qty = qty;
//   //   if (cart[index].qty == 0)
//   //     removeProduct(product);
//   //
//   //   calculateTotal();
//   //   notifyListeners();
//   // }
//
//   void clearCart() {
//    // cart.forEach((f) => f.qty = 1);
//     cart = [];
//     notifyListeners();
//   }
//
//   void calculateTotal() {
//     totalCartValue = 0;
//     cart.forEach((f) {
//       totalCartValue += f.price;
//     });
//   }
//
//   void notifyListeners() {}
// }
//

import 'dart:ui';

class Cart{
  String? name;
  List? favourite;
  var uid;
  String? image;
  double? price;

  Cart.fromJson(Map<String,dynamic>json){
    uid=json['id'];
    name=json['name'];
    image=json['image'];
    favourite=json['favourite'];
    price=json['price'];
  }

  Cart({
    this.price,
    this.name,
    this.image,
    this.uid,
    this.favourite,
  });

//User.fromSnapshot(DataSnapshot snapshot){

// id = snapshot.key;

//email = snapshot.value!['email'] ?? 'email';

//}
}