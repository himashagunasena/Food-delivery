
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_color.dart';



class Name extends StatefulWidget {

  @override
  State<Name> createState() => _NameState();
}

class _NameState extends State<Name> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Container(
      width: 45.w,
      child:  Text(
        AppConstant.name,
        //'${_currentUser.displayName}',
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColor.PrimaryColor),
      ));
  }
}

