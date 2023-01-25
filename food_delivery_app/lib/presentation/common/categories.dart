import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/presentation/common/category_title.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/utils/app_constant.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../model/data.dart';
import '../../provider/filter.dart';
import '../../provider/price_increase.dart';

class Categories extends StatefulWidget {
  //final Products products;
  const Categories( {Key? key,}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<bool> isCardEnabled = [];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<FilterItem>(context,
          listen: false)
          .product(0);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 3.h),
        child: Container(
        height: 16.h,

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),

              //padding: const EdgeInsets.all(6),

              itemCount: Category.categoryItem.length,
              itemBuilder: (BuildContext context, int index) {
                isCardEnabled.add(Category.categoryItem[index].select);

    return Consumer<FilterItem>(builder: (context, value,child) {
    return
                  Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<FilterItem>(context,
                          listen: false)
                          .productClear(index);
                      isCardEnabled.replaceRange(0, isCardEnabled.length, [
                        for (int i = 0; i < isCardEnabled.length; i++) false

                      ]);
                     isCardEnabled[index] = true;
                      AppConstant.click.add(true);
                          setState(() {});
                         // AppConstant.filter=value.getIndex;

                // if(Category.categoryItem[index].category==Data.productitem[index].category){
                //  value.getIndex.add(Data.productitem[index]);
                        Provider.of<FilterItem>(context,
                            listen: false)
                            .product(index);
                   // print(AppConstant.filter);
                   //}

                    },
                    child: Column(
                      children: [
                        SizedBox(
                            width: 20.w,
                            //height: 11.h,
                            child: Card(
                              color: isCardEnabled[index]
                                  ? AppColor.PrimaryColor
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                alignment: Alignment.center,
                                height: 10.h,
                                width: 15.w,
                                child: Transform.scale(
                                    scale: 0.6,
                                    child: Image.asset(
                                        Category.categoryItem[index].image)),
                              ),
                            )),
                        // SizedBox(height: 1.h,),
                        Padding(
                          padding: EdgeInsets.only(top: 1.h),
                          child: CatTitle(
                              title: Category.categoryItem[index].name),
                        ),
                        // SizedBox(height: 1.h,),
                      ],
                    ),
                  ));
    } );
              }),
        ));
  }
}
