import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Topic extends StatefulWidget {
  const Topic({
    Key? key,
    required this.topic,
  });

  final String topic;

  @override
  State<Topic> createState() => _TopicState();
}

// ignore: camel_case_types
class _TopicState extends State<Topic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      alignment: Alignment.bottomLeft,
      child: Text(
        widget.topic,
        style: GoogleFonts.inter(color: Colors.black, fontSize: 20),
        // style: TextStyle(fontSize: 23, color: AppColor.titleColor,),
      ),
    );
  }
}
