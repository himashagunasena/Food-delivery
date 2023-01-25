// ignore_for_file: file_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_delivery_app/model/data.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';

// ignore: camel_case_types
class Star extends StatefulWidget {
  const Star({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  State<Star> createState() => _StarState();
}

// ignore: camel_case_types
class _StarState extends State<Star> {

  @override
  Widget build(BuildContext context) {
    return 
      Row(
        children: [
          RatingBarIndicator(
          rating: widget.product.review,
          itemBuilder: (context, index) =>
          const Icon(
            Icons.star,
            color: AppColor.PrimaryColor,
          ),
          itemCount: 5,
          itemSize: 20.0,
          direction: Axis.horizontal,
          unratedColor: Colors.amber.shade200,
          itemPadding: EdgeInsets.only(left: 0.5.sp),
    ),
          SizedBox(width: 10.sp,),
          Text(widget.product.review.toString(), style: TextStyle(fontSize: 14.sp),)
        ],
      );
  }
}
