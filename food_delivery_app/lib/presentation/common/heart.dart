import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/model/cart.dart';
import 'package:food_delivery_app/utils/app_constant.dart';

import '../../model/data.dart';

class Heart extends StatefulWidget {
  //var product;
  Products? products;

  Heart({Key? key,  this.products}) : super(key: key);

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {

 // bool selected = false;
  int count=0;
  // Future addFav() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   final User? user = auth.currentUser;
  //   CollectionReference collection =
  //       FirebaseFirestore.instance.collection('Favourite');
  //   return collection.doc(user!.uid).set({
  //     "name": widget.product["name"],
  //     "image": widget.product["image"],
  //     "price": widget.product["price"],
  //     "uid": widget.product["uid"],
  //     "id": widget.product["id"],
  //   });
  // }
@override
  void initState() {
    // TODO: implement initState
  if(AppConstant.selected=true && widget.products?.select==true){
    AppConstant.selected=false;
  }
  AppConstant.selected=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Favourite")
          .where("uid", isEqualTo: user!.uid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Text("");
        }
        return Padding(
          padding: const EdgeInsets.only(right: 8),
          child: IconButton(
            icon: Icon(
              AppConstant.selected ? Icons.favorite : Icons.favorite_border,
              size: 28,
              color:  AppConstant.selected  ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                AppConstant.selected = ! AppConstant.selected ;
                count = count + 1;
              });
              if ( AppConstant.selected ) {
                // widget.product["name"] = widget.products!.name;
                // widget.product["price"] = widget.products!.price;
                // widget.product["ui"] = user!.uid;
                // widget.product["image"] = widget.products!.image;
                // widget.product["id"] = count;

                FirebaseFirestore.instance.collection('Favourite').add({
                 'name':widget.products!.name,
                'id':count,
                'price':widget.products!.price,
                'uid':user!.uid,
                'image':widget.products!.image,
                'select': AppConstant.selected}
                );
              } else{
                FirebaseFirestore.instance.collection('Favourite').doc('uid').delete();
                AppConstant.selected=false;
              }
              //   snapshot.data.docs.length == 0
              //       ?
              //   addFav()
              //       : print("Already Added");
              // },
            }
          ),
        );
      },
    );
  }
}
