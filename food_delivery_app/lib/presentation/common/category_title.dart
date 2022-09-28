// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

// ignore: camel_case_types
class CatTitle extends StatefulWidget {
  const CatTitle({
    Key? key,
    required this.title,
    required this.left,
    required this.right,
  }) : super(key: key);

  final String title;
  final double left, right;

  @override
  State<CatTitle> createState() => _CatTitleState();
}

// ignore: camel_case_types
class _CatTitleState extends State<CatTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.left, right: widget.right, top: 8),
      child: Text(
        widget.title,
        style: GoogleFonts.poppins(fontSize: 14, color: AppColor.titleColor),
      ),
    );
  }
}
