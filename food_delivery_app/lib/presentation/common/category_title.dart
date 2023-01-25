// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../utils/app_color.dart';

// ignore: camel_case_types
class CatTitle extends StatefulWidget {
  const CatTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;


  @override
  State<CatTitle> createState() => _CatTitleState();
}

// ignore: camel_case_types
class _CatTitleState extends State<CatTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: widget.left.w, right: widget.right.w, top: 8),
      child: Text(
        widget.title,
        style: GoogleFonts.poppins(fontSize: 14, color: AppColor.titleColor),
      ),
    );
  }
}
