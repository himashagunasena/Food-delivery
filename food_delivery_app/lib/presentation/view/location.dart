import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/model/product_data.dart';
import 'package:food_delivery_app/presentation/common/name.dart';
import 'package:food_delivery_app/provider/location.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../main.dart';
import '../../utils/app_color.dart';

class Location extends StatefulWidget {
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    // Provider.of<UpdateLocation>(context, listen: false).addLocation();
    //AppConstant.location=value.getLocation;
  }

  @override
  Widget build(BuildContext context) {
      return Container(
        width: 46.w,
          child: Text(
            AppConstant.location,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black87,
            //height: 2.sp,
            ),
          ));

  }
}
