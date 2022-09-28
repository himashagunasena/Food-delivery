// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

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
