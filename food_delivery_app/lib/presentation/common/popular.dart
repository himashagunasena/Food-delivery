// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/place.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_color.dart';
import '../view/product_view.dart';

class Popular extends StatefulWidget {
  Popular({
    Key? key,
    required this.image,
    required this.name,
    required this.place,
    required this.review,
    required this.time,
    required this.price,
    this.select = false, required this.index,
  });

  final String image;
  final String name;
  final String place;
  final String review;
  final String time;
  final String price;
  late bool select;
  final int index;

  void toggleFavoriteStatus() {
    select = !select;

  }

  @override
  State<Popular> createState() => _PopularState();
}

// ignore: camel_case_types
class _PopularState extends State<Popular> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget>ListofProduct= [Product(text: "a"),Product(text: "b"),Product(text: "c")];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Container(
        //alignment: Alignment.centerLeft,
        height: size.height / 2.8,
        width: size.width / 2.3,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.bgColor,
            Color.fromARGB(255, 241, 241, 241),
            Colors.white,
            Colors.white,
          ],
        )),
        child: Stack(
          children: <Widget>[
            //Padding(padding: EdgeInsets.only(left: 10, right: 10)),

            Column(
              children: [
                Container(
                  //margin: EdgeInsets.only(bottom: 200),
                  child: Image(
                    image: AssetImage(widget.image),
                    height: size.height/5.5,
                    width: size.height/5.5,

                    fit: BoxFit.fitWidth,
                    // alignment: Alignment.bottomCenter,
                  ),
                ),
                Container(

                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) =>ListofProduct[widget.index] ));},
                        child: Text(
                          widget.name,
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      PlaceName(text: widget.place),
                      // Text(
                      //   widget.place,
                      //   style: GoogleFonts.poppins(
                      //       fontSize: 14, color: AppColor.titleColor)
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: size.height / 25,
                          ),
                          const Icon(
                            Icons.star,
                            size: 18,
                            color: AppColor.PrimaryColor,
                          ),
                          SizedBox(
                            width: size.width / 1000,
                          ),
                          Text(widget.review),
                          SizedBox(
                            width: size.width / 15,
                          ),
                          const Icon(
                            Icons.timer,
                            size: 15,
                          ),
                          SizedBox(
                            width: size.width / 1000,
                          ),
                          Text(widget.time),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: size.height / 30,
                          ),
                          SizedBox(
                            width: size.width / 1000,
                          ),
                          Text(
                            widget.price,
                            style: GoogleFonts.poppins(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: size.width / 19,
                          ),
                          IconButton(
                            icon: Icon(
                              widget.select
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              size: 28,
                              color: widget.select ? Colors.red : Colors.black,
                            ),
                            onPressed : () =>{
                              setState(() {
                                //color: ;
                                widget.toggleFavoriteStatus();

                                // if (_select) {
                                //   _select = true;
                                // } else {
                                //   _select = false;
                                // }
                              }),
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
