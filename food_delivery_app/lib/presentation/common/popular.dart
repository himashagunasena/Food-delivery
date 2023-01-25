// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/presentation/common/heart.dart';
import 'package:food_delivery_app/presentation/common/place.dart';
import 'package:food_delivery_app/presentation/view/signup.dart';
import 'package:food_delivery_app/provider/filter.dart';
import 'package:food_delivery_app/provider/quantity.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';
import '../../model/userData.dart';
import '../../provider/price_increase.dart';
import '../../utils/app_color.dart';
import '../view/product_view.dart';

class Popular extends StatefulWidget {
  //  final Products products;
  // const Popular({required this.products});

  // void toggleFavoriteStatus() {
  //}

  @override
  State<Popular> createState() => _PopularState();
}

// ignore: camel_case_types
class _PopularState extends State<Popular> {
  @override
  void initState() {
    Provider.of<FilterItem>(context, listen: false).commonProduct();
   fetchProducts();
    super.initState();
  }

  User? user = FirebaseAuth.instance.currentUser;

  List newFav = [];
  late int newval;
  fetchProducts() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("Favourite").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        newFav.add({
          "name": qn.docs[i]["name"],
          "uid": qn.docs[i]["uid"],
          "price": qn.docs[i]["price"],
          "image": qn.docs[i]["image"],
        });
      }
    });

    return qn.docs;
  }



  // List<Map<String, dynamic>> updatedList = [];

  // if (user != null) {
  //   setState(() async {
  //     newFav= UserData().favourite!;
  //   });}

  //List<Widget>ListofProduct= [Product(text: "a"),Product(text: "b"),Product(text: "c")];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
        height: 50.h,
        width: 100.w,
        child: Consumer<FilterItem>(builder: (context, value, child) {
          return ListView.builder(
              itemCount: value.filter.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Column(
                      children: [
                        ConstrainedBox(
                          constraints: new BoxConstraints(
                              minHeight: 40.h, minWidth: 45.w),
                          child: Container(
                            //alignment: Alignment.centerLeft,
                            // height:,
                            // width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColor.bgColor.withOpacity(0),
                                    //AppColor.bgColor,
                                    //Color.fromARGB(255,241,241,241),
                                    Colors.white,
                                    Colors.white,
                                  ],
                                )),
                            //Padding(padding: EdgeInsets.only(left: 10, right: 10)),

                            child: Column(
                              children: [
                                Container(
                                  //margin: EdgeInsets.only(bottom: 200),
                                  child: Image(
                                    image:
                                        AssetImage(value.getIndex[index].image),
                                    height: 20.h,
                                    width: 20.h,

                                    fit: BoxFit.fitWidth,
                                    // alignment: Alignment.bottomCenter,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              AppConstant
                                                  .textEditingController = "";
                                              AppConstant.isBack = false;

                                              print(index);
                                              print(
                                                  value.getIndex[index].index);
                                            });
                                            Provider.of<FilterItem>(context,
                                                    listen: false)
                                                .Resturentr(index);
                                            print(value.resturant);
                                            // if(index!=value.getIndex[index].index){
                                            //   index=value.getIndex[index].index;
                                            // } else{index=index;}
                                            if (value.filter == []) {
                                              Provider.of<PriceIncrease>(
                                                      context,
                                                      listen: false)
                                                  .clear(
                                                      Data.productitem[index]);
                                              Provider.of<Quantity>(context,
                                                      listen: false)
                                                  .clear();
                                              for(int i=0;i<newFav.length;i++){
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Product(
                                                            products:
                                                                Data.productitem[
                                                                    index],
                                                          )));}
                                            } else {
                                              Provider.of<PriceIncrease>(
                                                      context,
                                                      listen: false)
                                                  .clear(
                                                      Data.productitem[index]);
                                              Provider.of<PriceIncrease>(
                                                      context,
                                                      listen: false)
                                                  .clear(value.filter[index]);
                                              Provider.of<Quantity>(context,
                                                      listen: false)
                                                  .clear();
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Product(
                                                            products: value
                                                                .filter[index],
                                                          )));

                                              print(AppConstant.newPrice
                                                      .toString() +
                                                  "x");
                                            }
                                          },
                                          child: Column(children: [
                                            Text(
                                              value.getIndex[index].name,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500),
                                              textAlign: TextAlign.left,
                                            ),
                                            PlaceName(
                                              // text: "",
                                              text: value.getIndex[index].place,
                                            ),
                                          ])),

                                      // Text(
                                      //   widget.place,
                                      //   style: GoogleFonts.poppins(
                                      //       fontSize: 14, color: AppColor.titleColor)
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: AppColor.PrimaryColor,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            (value.getIndex[index].review)
                                                .toString(),
                                          ),
                                          SizedBox(
                                            width: 5.w,
                                          ),
                                          const Icon(
                                            Icons.timer,
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            value.getIndex[index].time,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          SizedBox(
                                              // width: 1.w,
                                              ),
                                          Text(
                                            "Rs " +
                                                value.getIndex[index].price
                                                    .toString() +
                                                "0",
                                            style: GoogleFonts.poppins(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                          ),
                                          SizedBox(
                                              //width: 8.w,
                                              ),
                                          Container(
                                              padding:
                                                  EdgeInsets.only(left: 7.w),
                                              //                               child: IconButton(
                                              //                                 icon: Icon(
                                              //                                   value.getIndex[index].select
                                              //                                       ? Icons.favorite
                                              //                                       : Icons.favorite_border,
                                              //                                   size: 28,
                                              //                                   color: value.getIndex[index]
                                              //                                           .select
                                              //                                       ? Colors.red
                                              //                                       : Colors.black,
                                              //                                 ),
                                              //                                 onPressed: () => {
                                              //                                   setState(() {
                                              //                                     //color: ;
                                              //                                     value.getIndex[index]
                                              //                                             .select =
                                              //                                         !value.getIndex[index]
                                              //                                             .select;
                                              //
                                              //                                     if (value.getIndex[index]
                                              //                                         .select) {
                                              //                                       AppConstant.faviourite
                                              //                                           .add(Data.productitem[
                                              //                                               index]);
                                              //                                       //   print(AppConstant.faviourite[index].name);
                                              //
                                              //                                       // print(newFav);
                                              //                                       // _favourite();
                                              //                                     } else {
                                              //                                       AppConstant.faviourite
                                              //                                           .remove(
                                              //                                               Data.productitem[
                                              //                                                   index]);
                                              //                                       // print(AppConstant.faviourite);
                                              //                                       //newFav.remove(AppConstant.faviourite);
                                              //                                       // print(newFav);
                                              //                                       //  _favourite();
                                              //                                     }
                                              //
                                              //                                     for (int i = 0;
                                              //                                         i <
                                              //                                             AppConstant
                                              //                                                 .faviourite
                                              //                                                 .length;
                                              //                                         i++) {
                                              //                                       if (value.getIndex[index]
                                              //                                           .select) {
                                              //                                         newFav.add(Data
                                              //                                             .productitem[index]
                                              //                                             .index);
                                              //                                         newFav = newFav
                                              //                                             .toSet()
                                              //                                             .toList();
                                              //                                         FirebaseFirestore
                                              //                                             .instance
                                              //                                             .collection(
                                              //                                             'Favourite')
                                              //                                             .doc(user!.uid)
                                              //                                             .update({
                                              //                                           "favourite": newFav
                                              //                                         }).catchError((e) {
                                              //                                           print(e);
                                              //                                         });
                                              //
                                              //                                         print(newFav);
                                              //                                       } else {
                                              //                                         newFav.remove(Data
                                              //                                             .productitem[index]
                                              //                                             .index);
                                              //
                                              //                                         FirebaseFirestore
                                              //                                             .instance
                                              //                                             .collection(
                                              //                                             "Favourite")
                                              //                                             .doc("favourite")
                                              //                                             .delete();
                                              //                                       }
                                              //                                     }
                                              //                                     print(newFav);
                                              //                                     // if (_select) {
                                              //                                     //   _select = true;
                                              //                                     // } else {
                                              //                                     //   _select = false;
                                              //                                     // }
                                              //                                   }),
                                              //                                   AppConstant.indexFav=newFav,
                                              // //_favourite(),
                                              //
                                              //
                                              // if (AppConstant.indexFav.isNotEmpty){
                                              //
                                              // FirebaseFirestore.instance
                                              //     .collection("Favourite")
                                              //     .add({
                                              // "favourite": AppConstant.indexFav,
                                              // "uid":user!.uid,
                                              // })}}
                                              //

                                              // child: Heart(
                                              //   product: newFav[index],
                                               )
                //),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ));
              });
        }));
  }
}
