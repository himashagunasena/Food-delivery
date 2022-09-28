import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';

class PlaceName extends StatefulWidget {
  final String text;

  PlaceName({required this.text});

  @override
  _PlaceNameState createState() => new _PlaceNameState();
}

class _PlaceNameState extends State<PlaceName> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 16) {
      firstHalf = widget.text.substring(0, 16);
      secondHalf = widget.text.substring(15, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
     // padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf, style: GoogleFonts.poppins(
          fontSize: 14, color: AppColor.titleColor),textAlign: TextAlign.start,
      )
          : new Column(
        children: <Widget>[
          new Text(flag ? (firstHalf + " . . .") : (firstHalf + secondHalf),style: GoogleFonts.poppins(
    fontSize: 14, color: AppColor.titleColor),textAlign: TextAlign.start),
          new InkWell(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
            //     new Text(
            //       flag ? "show more" : "show less",
            //       style: new TextStyle(color: Colors.blue),
            //    ),
              ],
            ),
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
          ),
        ],
      ),
    );
  }
}