import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/presentation/common/bootom_nav.dart';
import 'package:food_delivery_app/presentation/common/categories.dart';
import 'package:food_delivery_app/presentation/common/category_title.dart';
import 'package:food_delivery_app/presentation/common/customText.dart';
import 'package:food_delivery_app/presentation/common/popular.dart';
import 'package:food_delivery_app/presentation/common/topic.dart';
import 'package:food_delivery_app/presentation/view/product_view.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 50),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                        width: 63,
                        height: 63,
                        child: Image.asset('assets/icons/pro.png')),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 16),
                      child: Column(
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
                              Text(
                                "Panchali",
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: AppColor.PrimaryColor),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Row(children: [
                                  const Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Icon(
                                      Icons.place,
                                      color: AppColor.PrimaryColor,
                                      size: 20,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 10.0, right: 10),
                                    child: Text(
                                      "Badulla, SL",
                                      style: GoogleFonts.inter(fontSize: 14),
                                    ),
                                  )
                                ])
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width / 3.6,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 11.0),
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
                              icon: SvgPicture.asset('assets/icons/menu2.svg'),
                              iconSize: 10,
                              onPressed: () {},
                            ))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 31),
                  child: Row(
                    children: [
                      const customText(
                        go: TextInputAction.go,
                        hint: "Find your taste",
                        preffix: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        textwidth: 1.3,
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
                Topic(topic: "Categories"),
                Categories(),
                Topic(topic: "Most Popular Foods"),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [Data.productitem[0],
                      Data.productitem[1],
                      Data.productitem[2],


               ] ),
                //BottomNavigation(index: 0,),
                )],
            ),
          ),
        ));
  }
}

