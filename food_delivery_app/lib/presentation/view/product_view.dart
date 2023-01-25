//
// import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/app_bar.dart';
import 'package:food_delivery_app/presentation/common/bootom_nav.dart';
import 'package:food_delivery_app/presentation/common/categories.dart';
import 'package:food_delivery_app/presentation/common/category_title.dart';
import 'package:food_delivery_app/presentation/common/customText.dart';
import 'package:food_delivery_app/presentation/common/favour_button.dart';
import 'package:food_delivery_app/presentation/common/heart.dart';
import 'package:food_delivery_app/presentation/common/popular.dart';
import 'package:food_delivery_app/presentation/common/product_common.dart';
import 'package:food_delivery_app/presentation/common/quantityItem.dart';
import 'package:food_delivery_app/presentation/common/star.dart';
import 'package:food_delivery_app/presentation/common/topic.dart';
import 'package:food_delivery_app/presentation/view/home.dart';
import 'package:food_delivery_app/provider/filter.dart';
import 'package:food_delivery_app/provider/quantity.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';
import '../../provider/price_increase.dart';

class Product extends StatefulWidget {
  final Products products;
  // final User? user;

  Product({required this.products});
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  int i = 0;
  @override
  void dispose() {
    AppConstant.isCardEnabled.clear();
    AppConstant.textEditingController = widget.products.price.toString();
    // AppConstant.lasthighprice = 0;
    // // TODO: implement dispose
    super.dispose();
  }


  String totalval = "";
  bool x = false;
  bool selected = false;
  bool Total() {
    setState(() {
      if (AppConstant.textEditingController == "") {
        totalval = widget.products.price.toString();
      } else {
        totalval = AppConstant.textEditingController;
      }
    });
    return x = true;
    // : Text("Rs "+AppConstant.textEditingController+"0",
    //    style: TextStyle(
    //        color: Colors.white, fontSize: 16.sp,fontWeight: FontWeight.w500),
    //  );
    //return x;
  }

  @override
  void initState() {
    AppConstant.textEditingController = widget.products.price.toString();
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  List newFav = [];
  late int newval;
  fetchProducts() async {
    QuerySnapshot qn =
        await FirebaseFirestore.instance.collection("products").get();
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

  //super.setState();}
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return Scaffold(
        extendBodyBehindAppBar: true,
        // appBar: AppBar(
        //   //scrolledUnderElevation: 2,
        //
        // ),
        //bottomNavigationBar: BottomNavigation(index: 1,),

        // list of images for scrolling
        body: Consumer3<PriceIncrease, Quantity, FilterItem>(
            builder: (context, value, val, v, child) {
          return Container(
              width: double.infinity,
              height: double.infinity,
              //height: size.height * 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bg.png"),
                    fit: BoxFit.fill),
              ),

              //physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                      height: 90.h,
                      child: NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) {
                          return [

                            SliverAppBar(
                              backgroundColor: AppColor.trans,
                              leading: IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      v.resturant = [];
                                      Provider.of<PriceIncrease>(context,
                                              listen: false)
                                          .clear(widget.products);
                                      Provider.of<FilterItem>(context,
                                              listen: false)
                                          .commonProduct();
                                      Provider.of<Quantity>(context,
                                              listen: false)
                                          .clear();
                                      // AppConstant.textEditingController =
                                      //     ((value.getCounter +
                                      //             widget.products.price)*val.getQuantity)
                                      //         .toString();
                                      //AppConstant.lasthighprice = 0;
                                      AppConstant.isCardEnabled = [];
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNavigation()));
                                    });
                                  }),
                              elevation: 0,
                              //expandedHeight: 0.0,
                              toolbarHeight: 70,
                              iconTheme:
                                  IconThemeData(color: Colors.black, size: 28),
                              actions: <Widget>[

                      // Flexible(child: SizedBox(height:20.h,width: 28, child: ListView.builder(
                      //         itemBuilder: (context, index) {
                      //           return  Heart(
                      //               product: 1,
                      //               products: widget.products,
                      //             );
                      //           },
                      //         itemCount:newFav.length,))),
                              Heart(
                              //product: newFav[],
                              products: widget.products,
                              ),

                                //  Heart(products: widget.products)

                                // IconButton(
                                //     icon: Icon(
                                //       Icons.favorite_outline_rounded,
                                //       color: Colors.black,
                                //     ),
                                //     onPressed: () {

                                // setState((){
                                //
                                // selected =!selected;
                                // });
                                // if(selected){
                                // widget.product["name"]=widget.products.name;
                                // widget.product["price"]=widget.products.price;
                                // widget.product["ui"]=user!.uid;
                                // widget.product["image"]=widget.products.image;
                                // }
                                // snapshot.data.docs.length == 0
                                // ? addFav()
                                //     : print("Already Added");
                                // },
                                //
                                //
                                //   ),
                              ],
                              floating: true,
                              snap: true,
                            )
                          ];
                        },
                        body: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 100.w,
                                    child: Stack(
                                      children: [
                                        Card(
                                          elevation: 0,
                                          color: AppColor.trans,
                                          child: CommonProduct(
                                            products: widget.products,
                                          ),
                                        ),
                                        Positioned(
                                          left: 50.w,
                                          child: Image.asset(
                                            widget.products.imagebg,
                                            fit: BoxFit.fill,
                                            scale: 0.25.h,
                                          ),
                                        )
                                      ],
                                    )),
                                Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child:
                                          const SubTopics(topic: "Ingredient"),
                                    ),
                                    Ing(products: widget.products),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 2.h),
                                      child:
                                          const SubTopics(topic: "Your Flavor"),
                                    ),
                                    FavourBtn(
                                      products: widget.products,
                                    ),
                                    DottedLine(
                                      dashLength: 2.h,
                                      dashGapLength: 2.h,
                                      lineThickness: 1,
                                      dashRadius: 16,
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    ItemQuantity(widget.products),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        // SizedBox(height: 2.h,),
                      )),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15)),
                    ),
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.only(left: 3.h),
                            height: 10.h,
                            width: 50.w,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Rs " + AppConstant.textEditingController + "0",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                        Container(
                            height: 10.h,
                            width: 50.w,
                            decoration: const BoxDecoration(
                              color: AppColor.PrimaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(15)),
                            ),
                            child: InkWell(
                              onTap: () {
                                print(v.resturant);
                                showDialog(
                                    context: context,
                                    //  barrierColor: Colors.transparent,
                                    builder: (BuildContext context) {
                                      return BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 5.0, sigmaY: 5.0),
                                        child: Dialog(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.5),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          child: Container(
                                              width: 80.w,
                                              height: 40.h,
                                              child: Row(
                                                children: [
                                                  Container(
                                                      width: 80.w,
                                                      height: 40.h,
                                                      child: ListView.builder(
                                                          itemCount: v
                                                              .resturant.length,
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Text(v
                                                                .resturant[
                                                                    index]
                                                                .name);
                                                            // return Image.asset(v.resturant[i].image);
                                                          }))
                                                ],
                                              )
                                              // child: AlertDialog(
                                              //   backgroundColor: Colors.white.withOpacity(0.5),
                                              //   elevation: 10,
                                              //   title: const Text('Title'),
                                              //   content: const Text('Some content here'),
                                              //   actions: [
                                              //     TextButton(
                                              //         onPressed: () {
                                              //           Navigator.of(context).pop();
                                              //         },
                                              //         child: const Text('Close'))
                                              //   ],
                                              // ),
                                              ),
                                        ),
                                      );
                                    });
                                // Container(
                                //   width: 80.w,
                                //   height: 40.h,
                                // )
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ));
        }));
  }
}
