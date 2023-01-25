import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/heart.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';
import '../../utils/app_color.dart';

class CustomkAppBar extends StatefulWidget {
 final String? title;
 final IconData icon;
 final VoidCallback onclick;
 final VoidCallback onclicklast;
 //final Widget? function;

  CustomkAppBar({Key? key, this.title, required this.onclick,required this.icon, required this.onclicklast})
      : super(key: key);

  @override
  State<CustomkAppBar> createState() => _CustomkAppBarState();
}

class _CustomkAppBarState extends State<CustomkAppBar> {
  @override
  Widget build(BuildContext context) {
    return
      Container(
        //height: 70.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 3.w,right: 3.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
IconButton(
            onPressed: widget.onclick,
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),

//expandedHeight: 0.0,
          Text(widget.title!,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w600),),
    IconButton(
    onPressed: widget.onclicklast,
    icon: Icon(
    widget.icon,
    color: Colors.black,
    )),
  ]),
      );}
}

