// ignore_for_file: dead_code

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/view/home.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../view/cart.dart';

class BottomNavigation extends StatefulWidget {
  // late final int index ;
  // BottomNavigation({ required this.index});

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
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<Widget> _pages = <Widget>[
      HomePage(),
      Cart(),
      HomePage(),
      Cart(),

    ];

    return

      Scaffold(
        body:_pages[_page] ,
        bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
          index: _page,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.home, size: 27, color:  Colors.white,),
            Icon(Icons.shopping_cart, size: 27, color:  Colors.white,),
            Icon(Icons.favorite_outline_rounded, size: 27, color:  Colors.white,),
           Icon(Icons.person, size: 27, color:  Colors.white),

          ],
          color: Colors.black,
          buttonBackgroundColor: AppColor.PrimaryColor,
          backgroundColor: AppColor.bgColor,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
               _page=index;
            });
          },
          letIndexChange: (index) => true,
        ),
      );

   // _pages.elementAt(_page);
    Container(
    color: Colors.blueAccent,
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text(_page.toString(), textScaleFactor: 10.0),
    ElevatedButton(
    child: Text('Go To Page of index 1'),
    onPressed: () {
    final CurvedNavigationBarState? navBarState =
    _bottomNavigationKey.currentState;
    navBarState?.setPage(1);
    },
    )
    ],
    ),
    ));


  }
}
