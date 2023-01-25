import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/star.dart';
import 'package:food_delivery_app/presentation/common/topic.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';

class CommonProduct extends StatefulWidget {
  @override
  final Products products;
  const CommonProduct({Key? key, required this.products}) : super(key: key);

  @override
  _CommonProductState createState() => _CommonProductState();
}

class _CommonProductState extends State<CommonProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
//mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.products.name,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 1.5.h,
          ),
          Container(
              width: 47.5.w,
              child: Text(
                widget.products.place,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
              )),
          SizedBox(
            height: 1.5.h,
          ),
//Data.productitem.asMap().entries.map((e) { Star()});
          Star(
            product: widget.products,
          ),
          SizedBox(
            height: 3.h,
          ),
          Image(image: AssetImage("assets/images/user.png")),
          SizedBox(
            height: 5.h,
          ),
          SubTopics(topic: "About Food"),
          SizedBox(
            height: 1.h,
          ),
          Container(
              width: 47.5.w,
              child: Text(
                widget.products.description,
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w300),
              )),
          SizedBox(
            height: 3.h,
          ),
        ]);
  }
}

class Ing extends StatefulWidget {
  @override
  final Products products;
  const Ing({Key? key, required this.products}) : super(key: key);

  @override
  _IngState createState() => _IngState();
}

class _IngState extends State<Ing> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 8.h,
      child: ListView.builder(
          itemCount: widget.products.ing.length,
          shrinkWrap: true,
//physics:NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,

//itemExtent:6 ,
          itemBuilder: (_, i) {
            return Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(children: <Widget>[
                  Flexible(
                      child: widget.products.ing[i].endsWith(widget.products
                                  .ing[(widget.products.ing.length - 1)]) ==
                              true
                          ? Text(
                              widget.products.ing[i].toString() + " ",
//textAlign: TextAlign.center,
                              maxLines: 2,
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )
                          : Text(
                              widget.products.ing[i].toString() + " | ",
//textAlign: TextAlign.center,
                              softWrap: false,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                              ),
                            )),
                ]));
          }),
    );
  }
}
