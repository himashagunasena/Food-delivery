import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../common/bootom_nav.dart';

class Cart extends StatefulWidget {



  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(


     //bottomNavigationBar: BottomNavigation(index: 1,),
      backgroundColor: AppColor.bgColor,
      body: Text("cart"),
    );
  }
}