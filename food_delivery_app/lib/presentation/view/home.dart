import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/model/product_data.dart';
import 'package:food_delivery_app/model/userData.dart';
import 'package:food_delivery_app/presentation/common/bootom_nav.dart';
import 'package:food_delivery_app/presentation/common/categories.dart';
import 'package:food_delivery_app/presentation/view/location.dart';
import 'package:food_delivery_app/presentation/common/customText.dart';
import 'package:food_delivery_app/presentation/common/name.dart';
import 'package:food_delivery_app/presentation/common/popular.dart';
import 'package:food_delivery_app/presentation/common/topic.dart';
import 'package:food_delivery_app/presentation/view/login.dart';
import 'package:food_delivery_app/presentation/view/product_view.dart';
import 'package:food_delivery_app/presentation/view/signup.dart';
import 'package:food_delivery_app/provider/fire_auth.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../provider/location.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width1 = MediaQuery.of(context);
    return Scaffold(
        //bottomNavigationBar: BottomNavigation(index: 0,),
        backgroundColor: AppColor.bgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 7.h),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(
                      width: 17.w,
                      height: 17.w,
                      child: Image.asset('assets/icons/pro.png')),
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Column(
                      // crossAxisAlignment: ,
                      children: [
                        Row(
                          children: [
                            Text("Hi!",
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Name(),
                          ],
                        ),
                        Container(
                          // width: 20.w,
                          padding: EdgeInsets.only(top: 2.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment:
                                  //MainAxisAlignment.spaceAround,
                                  children: [
                                    const Align(
                                      //alignment: Alignment.bottomLeft,
                                      child: Icon(
                                        Icons.place,
                                        color: AppColor.PrimaryColor,
                                        size: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Location()
                                  ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // SizedBox(
                  //   width: size.width / 3.6,
                  // ),
                  Stack(
                    children: [
                      Container(
                          // padding: EdgeInsets.only(left: 2.w),
                          child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 174, 174, 174),
                                    blurRadius: 10,
                                    offset: Offset(0, 4), // Shadow position
                                  ),
                                ],
                              ),
                              width: 50.0,
                              height: 50.0,
                              child: IconButton(
                                icon:
                                    SvgPicture.asset('assets/icons/menu2.svg'),
                                iconSize: 10,
                                onPressed: () {
                                  Provider.of<UpdateLocation>(context,
                                          listen: false)
                                      .addClear();
                                  AppConstant.name = "";
                                  AppConstant.location = "";
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => LogIn(),
                                  ));
                                  //   print(widget.user.uid);
                                  //
                                  //
                                },
                              ))),
                    ],
                  )
                ]),
                // SizedBox(width: 5.h,),

                Padding(
                  padding: const EdgeInsets.only(top: 31),
                  child: Row(
                    children: [
                      Container(
                        width: 72.w,
                        child: const customText(
                          go: TextInputAction.go,
                          hint: "Find your taste",
                          preffix: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          textwidth: 1.3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Ink(
                          decoration: ShapeDecoration(
                              color: AppColor.PrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              )),
                          width: 50.0,
                          height: 50.0,

                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          //   color: Colors.white,
                          // ),
                          child: IconButton(
                            icon: Image.asset('assets/icons/filter.png'),
                            iconSize: 50,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SubTopics(topic: "Categories"),

                Categories(),
                SizedBox(
                  height: 1.h,
                ),
                SubTopics(topic: "Most Popular Foods"),
                SizedBox(
                  height: 3.h,
                ),
                //  SingleChildScrollView(
                //
                //    child: Row(
                //      children: [Data.productitem[0],
                //        Data.productitem[1],
                //        Data.productitem[2],
                //
                //
                // ] ),
                //  //BottomNavigation(index: 0,),
                //  )
                Popular(),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ));
  }
}
