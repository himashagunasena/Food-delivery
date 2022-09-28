// // ignore_for_file: file_names, unused_local_variable
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import '../../utils/app_color.dart';

// // ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/presentation/common/category_title.dart';

import '../../utils/app_color.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);
  State<Categories> createState() => _CategoriesState();
}

// ignore: no_logic_in_create_state
class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(
          top: 27,
        ),
        child: DefaultTabController(
          length: 4,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.,
            children: <Widget>[
              ButtonsTabBar(
                physics: NeverScrollableScrollPhysics(),
                unselectedBackgroundColor: Colors.white,
                buttonMargin: EdgeInsets.only(right: 19),
                backgroundColor: AppColor.PrimaryColor,
                height: 68,
                tabs: [
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      width: 68,
                      child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset("assets/icons/all.png")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: 68,
                      child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset("assets/icons/pizza 3.png")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 68,
                      child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset("assets/icons/drink.png")),
                    ),
                  ),
                  Tab(
                    child: Container(
                      width: 68,
                      child: Transform.scale(
                          scale: 0.6,
                          child: Image.asset("assets/icons/asian.png")),
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    CatTitle(
                      title: "All",
                      left: 0,
                      right: 0,
                    ),
                    CatTitle(
                      title: "Pizza",
                      left: 20,
                      right: 0,
                    ),
                    CatTitle(
                      title: "Drinks",
                      left: 0,
                      right: 0,
                    ),
                    CatTitle(
                      title: "Assian",
                      left: 0,
                      right: 5,
                    ),
                  ]),
            ],
          ),
        ));
  }
}

//   const Categories({
//     Key? key,
//     required this.image,
//     this.hoverColor,
//     this.normalColor,
//     required this.title,
//   }) : super(key: key);
//   final String image;
//   final Color? hoverColor;
//   final Color? normalColor;
//   final String title;

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// // ignore: camel_case_types
// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Container(
//       padding: EdgeInsets.only(top: 27),
//       alignment: Alignment.bottomLeft,
//       child: Column(
//         children: [
//           Ink(
//             decoration: ShapeDecoration(
//                 color: AppColor.PrimaryColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(7),
//                 )),
//             width: 65.0,
//             height: 65.0,

//             // decoration: BoxDecoration(
//             //   borderRadius: BorderRadius.circular(10),
//             //   color: Colors.white,
//             // ),
//             child: Transform.scale(
//               scale: 0.8,
//               child: IconButton(
//                 icon: Image.asset(widget.image),
//                 //iconSize: 50,
//                 onPressed: () {},
//               ),
//             ),
//           ),
//           SizedBox(
//             height: size.width / 40,
//           ),
//           Text(
//             widget.title,
//             style:
//                 GoogleFonts.poppins(fontSize: 14, color: AppColor.titleColor),
//           )
//         ],
//       ),
//     );
//   }
// }