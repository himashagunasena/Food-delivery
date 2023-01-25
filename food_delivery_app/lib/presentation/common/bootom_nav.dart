// ignore_for_file: dead_code

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/view/favourite.dart';
import 'package:food_delivery_app/presentation/view/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_color.dart';
import '../../utils/app_constant.dart';
import '../view/cart.dart';
User? user = FirebaseAuth.instance.currentUser;
class BottomNavigation extends StatefulWidget {
 // final User? user;
 // //  // const BottomNavigation({ });
 // // final String? location ;
 //  BottomNavigation({  this.user});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

// ignore: camel_case_types
class _BottomNavigationState extends State<BottomNavigation> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    AppConstant.indexFav1=[];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> _pages = <Widget>[
      HomePage(),
      Favourite(),
      Cart(),
      Cart(),

    ];

    return

      Scaffold(
        body:_pages[_page] ,
        extendBody: true,
        bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
          index: _page,
          height: 75,
          items: <Widget>[
            Icon(Icons.home, size: 27, color:  Colors.white,),
            Icon(Icons.shopping_cart, size: 27, color:  Colors.white,),
            Icon(Icons.favorite_outline_rounded, size: 27, color:  Colors.white,),
           Icon(Icons.person, size: 27, color:  Colors.white),

          ],
          color: Colors.black,
          buttonBackgroundColor: AppColor.PrimaryColor,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {

            setState(() {
              // if(_page!=1){
              //  }
               _page=index;
               if(_page==1){
               AppConstant.indexFav1.isNotEmpty;}else{
AppConstant.indexFav1.isEmpty;
               }
            });
          },
          letIndexChange: (index) => true,
        ),
      );

   // _pages.elementAt(_page);
   //  Container(
   //  color: Colors.black12,
   //  child: Center(
   //  child: Column(
   //  mainAxisAlignment: MainAxisAlignment.center,
   //  children: <Widget>[
   //  Text(_page.toString(), textScaleFactor: 10.0),
   //  ElevatedButton(
   //  child: Text('Go To Page of index 1'),
   //  onPressed: () {
   //  final CurvedNavigationBarState? navBarState =
   //  _bottomNavigationKey.currentState;
   //  navBarState?.setPage(1);
   //  },
   //  )
   //  ],
   //  ),
   //  ));


  }
}
