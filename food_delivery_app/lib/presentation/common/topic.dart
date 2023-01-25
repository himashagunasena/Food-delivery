import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class Topic extends StatefulWidget {
  const Topic({
    Key? key,
    required this.topic,
  });

  final String topic;

  @override
  State<Topic> createState() => TopicState();
}

// ignore: camel_case_types
class TopicState extends State<Topic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 3.h),
      alignment: Alignment.bottomLeft,
      child: Text(
        widget.topic,
        style: GoogleFonts.inter(color: Colors.black, fontSize: 16.sp),
        // style: TextStyle(fontSize: 23, color: AppColor.titleColor,),
      ),
    );
  }
}




class SubTopics extends StatefulWidget {
  const SubTopics({
    Key? key,
    required this.topic,
  });

  final String topic;

  @override
  State<SubTopics> createState() => SubTopicsState();
}

class SubTopicsState extends State<SubTopics> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only( right: 2.h),
        child: Text(
          widget.topic,
          style:
          TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500,),textAlign: TextAlign.start,
        ));
  }
}