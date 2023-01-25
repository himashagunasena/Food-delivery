// ignore_for_file: file_names, unused_local_variable


import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class customText extends StatefulWidget {
  const customText(
      {Key? key,
      this.controller,
      this.preffix,
      this.hint,
      required this.textwidth,
      this.go})
      : super(key: key);
  final TextEditingController? controller;
  final Widget? preffix;
  final TextInputAction? go;
  final String? hint;
  final num textwidth;

  @override
  State<customText> createState() => _customTextState();
}

// ignore: camel_case_types
class _customTextState extends State<customText> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / widget.textwidth,
      height: 50.0,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: HexColor("#FFC530")),
        child: TextField(
          textInputAction: widget.go,
          textAlignVertical: TextAlignVertical.bottom,
          controller: widget.controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: widget.preffix,
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: const BorderSide(color: Colors.white)),
            focusColor: Colors.amber,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: HexColor("#FFC530"), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}

class customNewText extends StatefulWidget {
  customNewText(
      {Key? key,
      this.controller,
      this.preffix,
      this.hint,
      required this.textwidth,
      this.go,
      required this.lable, required this.password,})
      : super(key: key);
  final TextEditingController? controller;
  final Widget? preffix;
  final TextInputAction? go;
  final String? hint;
  final String lable;
  final bool password;
  final num textwidth;


  @override
  State<customNewText> createState() => _customNewTextState();
}

// ignore: camel_case_types
class _customNewTextState extends State<customNewText> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width / widget.textwidth,
      height: 16.h,
      child: Theme(
        data: Theme.of(context).copyWith(primaryColor: HexColor("#FFC530")),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.lable,
              style: TextStyle(fontSize: 14.sp, color: AppColor.titleColor),
            ),
            SizedBox(height: 2.h,),
      Expanded(child:TextField(

              textInputAction: widget.go,
        obscureText: widget.password,
              textAlignVertical: TextAlignVertical.bottom,
              controller: widget.controller,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: widget.preffix,
                hintText: widget.hint,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: const BorderSide(color: AppColor.PrimaryColor)),
                focusColor: Colors.amber,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: BorderSide(color: HexColor("#FFC530"), width: 2),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
