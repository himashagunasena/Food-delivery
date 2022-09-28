import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/bootom_nav.dart';
import 'package:food_delivery_app/presentation/common/categories.dart';
import 'package:food_delivery_app/presentation/common/category_title.dart';
import 'package:food_delivery_app/presentation/common/customText.dart';
import 'package:food_delivery_app/presentation/common/popular.dart';
import 'package:food_delivery_app/presentation/common/topic.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: use_key_in_widget_constructors
// class ProductView extends StatefulWidget {
//   final num index;
//
//   ProductView({required this.index});
//   @override
//   State<ProductView> createState() => _ProductViewState();
// }
//
// class _ProductViewState extends State<ProductView> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//         bottomNavigationBar: BottomNavigation(index: 1,),
//         backgroundColor: AppColor.bgColor,
//       body: ListView.builder(itemBuilder: )
//         );
//   }
// }
class Product extends StatefulWidget {
  final String text;

  Product({required this.text});
  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar:true,
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0, toolbarHeight: 70,
        iconTheme: IconThemeData(color: Colors.black,size: 28),
        actions: <Widget>[
        //IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),

        IconButton(icon: Icon(Icons.favorite_outline_rounded,color: Colors.black,), onPressed: () {}),
      ],),
     // bottomNavigationBar: BottomNavigation(index: 1,),

      body:  //
   Container(
      width: double.infinity,
      height: double.infinity,
      //height: size.height * 5,
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
    ),
    child:Column(children:[
      Text(widget.text),
      Text("my"),
    ]),
    )


    );
  }
}