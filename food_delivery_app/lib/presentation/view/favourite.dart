import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/model/userData.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../common/app_bar.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  late var x;
  int id = 0;
  // void _favourite() {

  void initState() {
//_favourite();
    // AppConstant.indexFav1=[];
    if (AppConstant.indexFav1.isNotEmpty && AppConstant.FavImage.isNotEmpty) {
      print('c');
      AppConstant.indexFav1.toSet();
      AppConstant.FavImage.toSet();
      AppConstant.FavPrice.toSet();
    } else {
      AppConstant.indexFav1.toSet();
      AppConstant.FavImage.toSet();
      AppConstant.FavPrice.toSet();
      FirebaseFirestore.instance
          .collection("Favourite")
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid)
          .get()
          .then((value) {
        for (var doc in value.docs) {
          if (doc.data()['select'] = true) {
            AppConstant.indexFav1.toSet().toList();
            AppConstant.FavImage.toSet().toList();
            AppConstant.FavPrice.toSet().toList();
            AppConstant.indexFav1.add(doc.data()["name"]);
            AppConstant.FavImage.add(doc.data()["image"]);
            AppConstant.FavPrice.add(doc.data()["price"]);

            // id=doc.data()["id"];
          }
        }
      });
      // TODO: implement initState
      super.initState();
    }
    print(AppConstant.indexFav1);
    print(AppConstant.FavImage.toSet());
  }

  @override
//String uid="";
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(
                height: 5.h,
              ),
              CustomkAppBar(
                onclick: () {},
                icon: Icons.delete,
                onclicklast: () {},
                title: "Favourite",
              ),
              ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 90.h),
                  //width: 100.w,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 3.w),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: AppConstant.indexFav1.toSet().length,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(children: [
                          Container(
                              //alignment: Alignment.topRight,
                              height: 20.h,
                              width: 100.w,
                              margin: EdgeInsets.only(
                                  left: 15.w, right: 10.w, bottom: 3.h),
                              padding: EdgeInsets.only(
                                 right: 2.w, left: 25.w, top: 3.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Card(
                                color: Colors.blue,
                                elevation: 1,
                                child:
                                Column(
                                  children: [
                                    Text(
                                      AppConstant.indexFav1
                                          .toSet()
                                          .toList()[index]
                                          .toString(),
                                      style: TextStyle(fontSize: 14.sp),
                                      textAlign: TextAlign.left,
                                    ),

                                    Text(
                                      AppConstant.FavPrice
                                          .toSet()
                                          .toList()[index]
                                          .toString(),
                                      style: TextStyle(fontSize: 12.sp),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              )),
                          Image.asset(
                            AppConstant.FavImage.toSet()
                                .toList()[index]
                                .toString(),
                            scale: 1.7,
                            alignment: Alignment.center,
                          ),
                        ]); //AppConstant.faviourite[AppConstant.indexFav[index]].name
                      },
                    ),
                  )),
              SizedBox(
                height: 10.h,
              )
            ])));
  }
}
